class Transaction < ActiveRecord::Base
  resourcify
  belongs_to :task
end
