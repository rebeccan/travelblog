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

ActiveRecord::Schema.define(version: 20141001160500) do

  create_table "comments", force: true do |t|
    t.string   "author"
    t.text     "body"
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["post_id"], name: "index_comments_on_post_id"

  create_table "galleries", force: true do |t|
    t.string   "name"
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "galleries", ["post_id"], name: "index_galleries_on_post_id"

  create_table "journeys", force: true do |t|
    t.string   "title"
    t.date     "start"
    t.date     "end"
    t.text     "text"
    t.boolean  "public"
    t.string   "password"
    t.string   "marker_color"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "likes", force: true do |t|
    t.string   "author"
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "likes", ["post_id"], name: "index_likes_on_post_id"

  create_table "marker_binaries", force: true do |t|
    t.string   "color"
    t.binary   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", force: true do |t|
    t.string   "url"
    t.boolean  "post_main"
    t.boolean  "travel_main"
    t.integer  "gallery_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url_seed"
  end

  add_index "photos", ["gallery_id"], name: "index_photos_on_gallery_id"

  create_table "posts", force: true do |t|
    t.string   "title"
    t.date     "date"
    t.string   "text"
    t.boolean  "draft"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "journey_id"
  end

  add_index "posts", ["journey_id"], name: "index_posts_on_journey_id"

  create_table "route_waypoint_orders", force: true do |t|
    t.integer  "order"
    t.integer  "route_id"
    t.integer  "waypoint_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "route_waypoint_orders", ["route_id"], name: "index_route_waypoint_orders_on_route_id"
  add_index "route_waypoint_orders", ["waypoint_id"], name: "index_route_waypoint_orders_on_waypoint_id"

  create_table "routes", force: true do |t|
    t.string   "travel_mode"
    t.boolean  "show_on_overview"
    t.integer  "route_able_id"
    t.string   "route_able_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "settings", force: true do |t|
    t.string   "name"
    t.boolean  "boolean"
    t.string   "attribute1"
    t.string   "attribute2"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "waypoints", force: true do |t|
    t.string   "name"
    t.float    "longitude"
    t.float    "latitude"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "show_on_overview"
  end

end
