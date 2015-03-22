class Activity < ActiveRecord::Base
  resourcify
  belongs_to :user
  belongs_to :subject, polymorphic:true
end
