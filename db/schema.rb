# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_04_234347) do

  create_table "artist_specialties", force: :cascade do |t|
    t.integer "artist_id", null: false
    t.integer "specialty_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["artist_id"], name: "index_artist_specialties_on_artist_id"
    t.index ["specialty_id"], name: "index_artist_specialties_on_specialty_id"
  end

  create_table "artists", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.text "bio"
    t.integer "rate"
    t.string "location"
    t.boolean "available"
    t.string "profile_picture"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "creators", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.text "bio"
    t.string "profile_picture"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "project_artists", force: :cascade do |t|
    t.integer "project_id", null: false
    t.integer "artist_id", null: false
    t.string "accepted", default: "pending"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["artist_id"], name: "index_project_artists_on_artist_id"
    t.index ["project_id"], name: "index_project_artists_on_project_id"
  end

  create_table "project_specialties", force: :cascade do |t|
    t.integer "project_id", null: false
    t.integer "specialty_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_project_specialties_on_project_id"
    t.index ["specialty_id"], name: "index_project_specialties_on_specialty_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.date "deadline"
    t.string "location"
    t.integer "creator_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["creator_id"], name: "index_projects_on_creator_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "artist_id", null: false
    t.integer "creator_id", null: false
    t.integer "rating"
    t.string "description"
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["artist_id"], name: "index_reviews_on_artist_id"
    t.index ["creator_id"], name: "index_reviews_on_creator_id"
  end

  create_table "specialties", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "artist_specialties", "artists", on_delete: :cascade
  add_foreign_key "artist_specialties", "specialties", on_delete: :cascade
  add_foreign_key "project_artists", "artists", on_delete: :cascade
  add_foreign_key "project_artists", "projects", on_delete: :cascade
  add_foreign_key "project_specialties", "projects", on_delete: :cascade
  add_foreign_key "project_specialties", "specialties", on_delete: :cascade
  add_foreign_key "projects", "creators", on_delete: :cascade
  add_foreign_key "reviews", "artists", on_delete: :cascade
  add_foreign_key "reviews", "creators", on_delete: :cascade
end
