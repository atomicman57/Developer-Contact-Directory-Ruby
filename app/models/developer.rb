class Developer < ApplicationRecord
    belongs_to :category

    validates_presence_of :first_name, :last_name, :email, :github_username, :phone_number, :website, :country, :category_id
    validates :email, uniqueness: true, email: true
end
