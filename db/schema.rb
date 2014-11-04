# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20141104053704) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: true do |t|
    t.integer  "github_id"
    t.integer  "github_user_id"
    t.string   "url"
    t.string   "html_url"
    t.text     "body"
    t.datetime "remote_created_at"
    t.datetime "remote_updated_at"
    t.string   "pull_request_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "github_users", force: true do |t|
    t.string   "login"
    t.integer  "github_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pull_requests", force: true do |t|
    t.integer  "repository_id"
    t.integer  "github_user_id"
    t.string   "url"
    t.integer  "github_id"
    t.integer  "number"
    t.string   "state"
    t.string   "title"
    t.text     "body"
    t.datetime "remote_created_at"
    t.datetime "remote_updated_at"
    t.datetime "closed_at"
    t.datetime "merged_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "repositories", force: true do |t|
    t.integer  "github_id"
    t.string   "name"
    t.boolean  "private"
    t.string   "html_url"
    t.string   "url"
    t.text     "description"
    t.datetime "remote_created_at"
    t.datetime "remote_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
