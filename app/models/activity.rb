class Activity < ApplicationRecord  
  has_and_belongs_to_many :gyms
  has_and_belongs_to_many :users
end
