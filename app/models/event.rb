class Event < ApplicationRecord  

  has_many :registrations
  belongs_to :gym
  has_many :recurrences
  has_many :users, :through => :registrations

end
