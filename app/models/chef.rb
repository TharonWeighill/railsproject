class Chef < ApplicationRecord
    belongs_to :restaurant, through: :gm
    has_many :kitchen_notes
    has_many :cooks
    has_many :dining_preps
    has_secure_password
    validates :password,    length: {in: 1..30}, confirmation: true, on: :create
    validates :chef_username, uniqueness:{:message => "Username already exists."}, length: {in: 3..30}
    validates :email, presence: true, uniqueness: true 
end 