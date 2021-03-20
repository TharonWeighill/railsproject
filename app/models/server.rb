class Server < ActiveRecord::Base
    belongs_to :restaurant, through: :agm
    has_many :kitchen_preps, through: :agm
    has_secure_password
    validates :password,    length: {in: 1..30}, confirmation: true, on: :create
    validates :server_username, uniqueness:{:message => "Username already exists."}, length: {in: 3..30}
    validates :email, presence: true, uniqueness: true 
end 