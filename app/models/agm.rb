class Agm < ActiveRecord::Base
    belongs_to :restaurant through :gm
    
end 