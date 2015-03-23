class Transaction < ActiveRecord::Base
  resourcify
  belongs_to :task
  belongs_to :user


end
