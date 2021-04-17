class Recipe < ApplicationRecord
    attr_accessor :ingredients_ids, :quantity, :unit
    has_many :comments
    belongs_to :bartender
    has_many :ingredient_recipes
    has_many :ingredients, through: :ingredient_recipes
    validates :name, presence: true, uniqueness: true
    validates :category, presence: true
end 