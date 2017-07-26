class Gym < ApplicationRecord
  has_and_belongs_to_many :activities
  has_many :ratings
  has_many :events
  belongs_to :user
  has_many :memberships
  has_many :subscriptions, through: :memberships, :foreign_key => :subscription_id
  belongs_to :favorite
  has_many :registrations, :through => :events
  has_many :users, :through => :registrations
end

# TODO: (ross) change duration from timestamp to time in schema
