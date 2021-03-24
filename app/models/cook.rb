class Cook < ApplicationRecord
    belongs_to :restaurant, through: :chef
    has_many :kitchen_preps, through: :chef
    has_secure_password
    validates :password,    length: {in: 1..30}, confirmation: true, on: :create
    validates :cook_username, uniqueness:{:message => "Username already exists."}, length: {in: 3..30}
    validates :email, presence: true, uniqueness: true 
end 