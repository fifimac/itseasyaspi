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

ActiveRecord::Schema.define(:version => 20131213151312) do

  create_table "comments", :force => true do |t|
    t.string   "title"
    t.text     "text"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "galleries", :force => true do |t|
    t.string   "image"
    t.string   "submitted_by"
    t.string   "step"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "image_comment"
  end

  create_table "instructions", :force => true do |t|
    t.integer  "step"
    t.string   "title"
    t.string   "content"
    t.string   "images"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "microposts", :force => true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "microposts", ["user_id"], :name => "index_microposts_on_user_id"

  create_table "profiles", :force => true do |t|
    t.string   "avatar"
    t.string   "location"
    t.string   "bio"
    t.string   "website"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "username"
  end

  create_table "replies", :force => true do |t|
    t.string   "commenter"
    t.text     "body"
    t.integer  "comment_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "replies", ["comment_id"], :name => "index_replies_on_comment_id"

  create_table "skirtpatterns", :force => true do |t|
    t.integer  "user_id"
    t.string   "makepattern"
    t.string   "unit"
    t.string   "skirt_type"
    t.integer  "waist"
    t.integer  "length"
    t.integer  "canvas1"
    t.integer  "canvas2"
    t.integer  "canvas3"
    t.integer  "inner_radius"
    t.integer  "outer_radius"
    t.integer  "waistbandLgth"
    t.integer  "waistbandWdth"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "userprofiles", :force => true do |t|
    t.string   "username"
    t.string   "location"
    t.string   "bio"
    t.string   "website"
    t.string   "avatar"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "username"
    t.string   "location"
    t.string   "bio"
    t.string   "avatar"
    t.boolean  "admin",                  :default => false
  end

end
