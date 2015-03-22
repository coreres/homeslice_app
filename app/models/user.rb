class User < ActiveRecord::Base
  rolify
# Relations
has_many :posts
has_many :tasks
has_many :transactions
has_one :account
has_many :activities


enum role: { client: 0, agent: 1, broker: 2, admin: 3 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :confirmable, :omniauthable
  
  # Pagination
  paginates_per 100

  # Validations
  # :email
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  def self.paged(page_number)
    order(admin: :desc, email: :asc).page page_number
  end

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.username = auth.info.nickname
    end
  end

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"], without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end

  def self.search_and_order(search, page_number)
    if search
      where("email LIKE ?", "%#{search.downcase}%").order(
      admin: :desc, email: :asc
      ).page page_number
    else
      order(admin: :desc, email: :asc).page page_number
    end
  end

def password_required?
  super && provider.blank?
end

def update_with_password(params, *options)
  if encrypted_password.blank?
    update_attributes(params, *options)
  else
    super
  end
end

  def self.last_signups(count)
    order(created_at: :desc).limit(count).select("id","email","created_at")
  end

  def self.last_signins(count)
    order(last_sign_in_at:
    :desc).limit(count).select("id","email","last_sign_in_at")
  end

  def self.users_count
    where("admin = ? AND locked = ?",false,false).count
  end

  def name
   name = "#{first_name.capitalize} #{last_name.capitalize}"
  end


end
