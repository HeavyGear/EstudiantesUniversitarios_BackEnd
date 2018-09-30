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

ActiveRecord::Schema.define(version: 20180929224353) do

  create_table "document_states", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "documents", force: :cascade do |t|
    t.string   "link"
    t.integer  "documentable_id"
    t.string   "documentable_type"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["documentable_type", nil], name: "index_documents_on_documentable_type_and_documetable_id"
  end

  create_table "images", force: :cascade do |t|
    t.string   "link"
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["imageable_type", "imageable_id"], name: "index_images_on_imageable_type_and_imageable_id"
  end

  create_table "majors", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "project_documents", force: :cascade do |t|
    t.integer  "state"
    t.integer  "document"
    t.integer  "project"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "project_states", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "user"
    t.integer  "supervisor"
    t.integer  "state"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "publication_documents", force: :cascade do |t|
    t.integer  "publication"
    t.integer  "document"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "publication_images", force: :cascade do |t|
    t.integer  "publication"
    t.integer  "image"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "publications", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "startdate"
    t.datetime "enddate"
    t.string   "place"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.integer  "typePublication"
    t.integer  "user"
    t.integer  "parent"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "type_publications", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "universities", force: :cascade do |t|
    t.string   "name"
    t.string   "city"
    t.string   "department"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_images", force: :cascade do |t|
    t.integer  "user"
    t.integer  "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_major_universities", force: :cascade do |t|
    t.integer  "user"
    t.integer  "major"
    t.integer  "university"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_project_documents", force: :cascade do |t|
    t.integer  "user"
    t.integer  "projectDocument"
    t.string   "description"
    t.string   "answer"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.integer  "idNumber"
    t.string   "email"
    t.boolean  "beneficiary"
    t.integer  "role"
    t.integer  "project"
    t.integer  "university"
    t.integer  "major"
    t.integer  "image"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
