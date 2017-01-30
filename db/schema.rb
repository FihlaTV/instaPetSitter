# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170129020828) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "favorites", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "sitter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pets", force: :cascade do |t|
    t.string   "pet_kind"
    t.string   "breed"
    t.integer  "dog_lg"
    t.integer  "dog_md"
    t.integer  "dog_sm"
    t.integer  "cat"
    t.integer  "other"
    t.integer  "user_id"
    t.integer  "sitter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "photos", force: :cascade do |t|
    t.string   "image_id"
    t.integer  "user_id"
    t.integer  "sitter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sitter_id"], name: "index_photos_on_sitter_id", using: :btree
    t.index ["user_id"], name: "index_photos_on_user_id", using: :btree
  end

  create_table "ratings", force: :cascade do |t|
    t.integer  "star"
    t.integer  "user_id"
    t.integer  "sitter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "refile_attachments", force: :cascade do |t|
    t.integer  "oid",        null: false
    t.string   "namespace",  null: false
    t.datetime "created_at"
    t.index ["namespace"], name: "index_refile_attachments_on_namespace", using: :btree
    t.index ["oid"], name: "index_refile_attachments_on_oid", using: :btree
  end

  create_table "sit_pets", force: :cascade do |t|
    t.string   "pet_kind"
    t.string   "breed"
    t.integer  "dog_lg"
    t.integer  "dog_md"
    t.integer  "dog_sm"
    t.integer  "cat"
    t.integer  "other"
    t.integer  "sitter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sitters", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.string   "phone"
    t.string   "email"
    t.float    "lat"
    t.float    "long"
    t.boolean  "backyard"
    t.text     "preferences"
    t.string   "picture_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "phone"
    t.string   "email"
    t.string   "picture_id"
    t.text     "about_me"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "photos", "sitters"
  add_foreign_key "photos", "users"
end