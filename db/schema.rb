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

ActiveRecord::Schema.define(version: 20181120162508) do

  create_table "comments", force: :cascade do |t|
    t.text     "body"
    t.integer  "publication_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["publication_id"], name: "index_comments_on_publication_id"
  end

  create_table "document_states", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "documents", force: :cascade do |t|
    t.string   "content"
    t.string   "uploadeable_type"
    t.integer  "uploadeable_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["uploadeable_type", "uploadeable_id"], name: "index_documents_on_uploadeable_type_and_uploadeable_id"
  end

  create_table "images", force: :cascade do |t|
    t.string   "content"
    t.string   "imageable_type"
    t.integer  "imageable_id"
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
    t.integer  "document_state_id"
    t.integer  "project_id"
    t.boolean  "approved"
    t.integer  "year"
    t.integer  "period"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["document_state_id"], name: "index_project_documents_on_document_state_id"
    t.index ["project_id"], name: "index_project_documents_on_project_id"
  end

  create_table "project_states", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "user_id"
    t.integer  "project_state_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["project_state_id"], name: "index_projects_on_project_state_id"
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "publications", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "startdate"
    t.string   "place"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "user_id"
    t.integer  "type_publication_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["type_publication_id"], name: "index_publications_on_type_publication_id"
    t.index ["user_id"], name: "index_publications_on_user_id"
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

  create_table "user_universities", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "university_id"
    t.integer  "major_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["major_id"], name: "index_user_universities_on_major_id"
    t.index ["university_id"], name: "index_user_universities_on_university_id"
    t.index ["user_id"], name: "index_user_universities_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.integer  "idnumber"
    t.string   "email"
    t.boolean  "beneficiary"
    t.string   "password_digest"
    t.integer  "role_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["role_id"], name: "index_users_on_role_id"
  end

end
