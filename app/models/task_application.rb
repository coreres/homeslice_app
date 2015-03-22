class TaskApplication < ActiveRecord::Base
  resourcify
  belongs_to :user
  belongs_to :task
  enum status: { new: 0, accepted: 1, declined: 2, pending_review: 3 }

  after_create :create_activities


  def agent
    user
  end

  def client
    task.user
  end

  private

  def create_activities
    create_activity_for_agent
    create_activity_for_client
  end

  def create_activity_for_agent
    Activity.create(
        subject: self,
        name: 'application_submitted',
        direction: 'from',
        user: agent
    )
  end

  def create_activity_for_client
    Activity.create(
        subject: self,
        name: 'application_submitted',
        direction: 'to',
        user: seller
    )
  end
end
