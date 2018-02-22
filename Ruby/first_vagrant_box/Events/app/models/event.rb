class Event < ActiveRecord::Base
  belongs_to :users
  has_many :discussions
  has_many :attends
end
