class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  acts_as_token_authenticatable
  has_and_belongs_to_many :activities
  has_many :favorites
  has_many :ledger_entries
  has_one :subscription
  has_many :registrations
  has_many :events, :through => :registrations
  belongs_to :gym, optional: true
  has_and_belongs_to_many :friends, 
              class_name: "User", 
              join_table: :friendships, 
              foreign_key: :user_id, 
              association_foreign_key: :friend_user_id
  geocoded_by :address
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }
end
