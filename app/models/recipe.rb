class Recipe < ApplicationRecord
    # attr_accessor :ingredients_ids, :quantity, :unit
    has_many :comments
    belongs_to :bartender
    has_many :ingredient_recipes
    has_many :ingredients, through: :ingredient_recipes
    validates :name, presence: true, uniqueness: true
    validates :category, presence: true
    accepts_nested_attributes_for :ingredient_recipes, reject_if: lambda {|attributes| attributes["unit"].blank? || attributes["value"].blank?|| attributes["ingredient_id"].blank?} 
    scope :filter_by_category_name, -> (category_name) { where("category LIKE ?", "%#{category_name}%")}
end 