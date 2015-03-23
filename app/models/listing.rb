class Listing < ActiveRecord::Base
  belongs_to :user
  belongs_to :task
  enum status:[ :active => 0, :draft => 1, :cancelled => 2, :ended => 3 ]


end
