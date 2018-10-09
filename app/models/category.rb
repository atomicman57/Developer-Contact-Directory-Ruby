class Category < ApplicationRecord
  has_many :developers

  validates_presence_of :name
  validates :name, uniqueness: true
end
