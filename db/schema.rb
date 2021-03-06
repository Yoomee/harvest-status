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

ActiveRecord::Schema.define(version: 20151029113331) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "timeline_items", force: true do |t|
    t.integer  "timer_id"
    t.integer  "project_id"
    t.integer  "user_id"
    t.integer  "task_id"
    t.integer  "client_id"
    t.integer  "harvest_id"
    t.float    "hours"
    t.string   "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "icon"
    t.string   "gitlab_project"
    t.float    "investment_time"
    t.float    "client_time"
    t.float    "support_time"
    t.float    "biz_dev_time"
  end

  create_table "timers", force: true do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.integer  "task_id"
    t.integer  "client_id"
    t.integer  "harvest_id"
    t.decimal  "hours",      precision: 8, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "notes"
  end

end
