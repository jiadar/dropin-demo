class Subscription < ApplicationRecord
  belongs_to :user
  has_many :memberships
  has_many :gyms, through: :memberships, :foreign_key => :gym_id
end
