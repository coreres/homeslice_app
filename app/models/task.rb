class Task < ActiveRecord::Base
  before_filter :authenticate_user!
  resourcify
  include Payola::Sellable
  validates_presence_of :user
  validates_presence_of :title
  validates_presence_of :short_description
  validates_presence_of :location
  validates_presence_of :due_date_end
  validates_presence_of :time_estimate
  belongs_to :user
  has_one :transaction
  has_one :task_assignment
  enum status: { active: 0, in_progress: 1, completed: 2, cancelled: 0 }


  def agent
    user
  end

  def client
    task.user
  end

  def location

  end

  def checkout

  end

  private

  def create_activities
    create_activity_for_agent
    create_activity_for_client
  end

  def create_activity_for_agent
    Activity.create(
        subject: self,
        name: 'task_assigned',
        direction: 'to',
        user: agent
    )
  end

  def create_activity_for_client
    Activity.create(
        subject: self,
        name: 'task_assigned',
        direction: 'from',
        user: seller
    )
  end
end


