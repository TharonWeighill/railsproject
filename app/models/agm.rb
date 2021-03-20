class Agm < ActiveRecord::Base
    belongs_to :restaurant, through: :gm
    has_many :dining_notes
    has_many :servers
    has_many :dining_preps
    has_secure_password
    validates :password,    length: {in: 1..30}, confirmation: true, on: :create
    validates :agm_username, uniqueness:{:message => "Username already exists."}, length: {in: 3..30}
    validates :email, presence: true, uniqueness: true 
end 