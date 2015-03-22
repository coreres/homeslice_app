class Comment < ActiveRecord::Base
  belongs_to :task
  belongs_to :user


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


end
