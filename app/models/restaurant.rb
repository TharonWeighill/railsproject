class Restaurant < ApplicationRecord
    has :gm
    has :agm
    has :chef
    has_many :servers, through: :agm
    has_many :cooks, through: :chef
    has_many :dining_notes, through: :gm
    has_many :kitchen_notes, through: :gm
    has_secure_password
    validates :password,    length: {in: 1..30}, confirmation: true, on: :create
    validates :r_username, uniqueness:{:message => "Username already exists."}, length: {in: 3..30}
    validates :email, presence: true, uniqueness: true 
end 