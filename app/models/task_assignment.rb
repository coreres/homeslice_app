class TaskAssignment < ActiveRecord::Base
  belongs_to :user
  belongs_to :task

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
