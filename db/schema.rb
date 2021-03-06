# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_04_20_182050) do

  create_table "bartenders", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.text "about"
    t.string "uid"
    t.string "provider"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text "textbody"
    t.integer "recipe_id"
    t.integer "bartender_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bartender_id"], name: "index_comments_on_bartender_id"
    t.index ["recipe_id"], name: "index_comments_on_recipe_id"
  end

  create_table "ingredient_recipes", force: :cascade do |t|
    t.integer "recipe_id"
    t.integer "ingredient_id"
    t.string "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "unit"
    t.index ["ingredient_id"], name: "index_ingredient_recipes_on_ingredient_id"
    t.index ["recipe_id"], name: "index_ingredient_recipes_on_recipe_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.text "ingredient"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name"
    t.text "directions"
    t.string "category"
    t.integer "bartender_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bartender_id"], name: "index_recipes_on_bartender_id"
  end

  add_foreign_key "comments", "bartenders", on_delete: :cascade
  add_foreign_key "comments", "recipes", on_delete: :cascade
  add_foreign_key "recipes", "bartenders", on_delete: :cascade
end
