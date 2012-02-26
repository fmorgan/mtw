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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120225221026) do

  create_table "player_journals", :force => true do |t|
    t.integer  "player_id"
    t.string   "event"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "details"
    t.integer  "lock_version", :default => 0
  end

  create_table "players", :force => true do |t|
    t.string   "full_name"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "position"
    t.string   "team"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
    t.integer  "lock_version", :default => 0
  end

end
