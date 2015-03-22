class Account < ActiveRecord::Base
  resourcify
  belongs_to :user
end
