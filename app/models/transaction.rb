class Transaction < ActiveRecord::Base
  belongs_to :task
end
