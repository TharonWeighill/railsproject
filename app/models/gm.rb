class Gm < ActiveRecord::Base
    belongs_to :restaurant
    has :agm
    has :chef
    has_many :servers
    has_many :cooks
    has_many :dining_notes
    has_many :kitchen_notes
    has_secure_password
    validates :password,    length: {in: 1..30}, confirmation: true, on: :create
    validates :gm_username, uniqueness:{:message => "Username already exists."}, length: {in: 3..30}
    validates :email, presence: true, uniqueness: true 
end 