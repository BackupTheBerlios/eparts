# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 18) do

  create_table "blobs", :force => true do |t|
    t.string   "name",       :limit => 30
    t.binary   "data",       :limit => 7340032
    t.string   "format",     :limit => 20
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "blobs_components", :id => false, :force => true do |t|
    t.integer "component_id"
    t.integer "blob_id"
  end

  create_table "component_categories", :force => true do |t|
    t.string "name"
  end

  create_table "component_housings", :force => true do |t|
    t.string "name"
  end

  create_table "components", :force => true do |t|
    t.string   "name"
    t.string   "remark"
    t.integer  "component_category_id"
    t.integer  "component_housing_id"
    t.string   "kicad_name_d"
    t.integer  "kicad_housing_id_d"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "components_photos", :id => false, :force => true do |t|
    t.integer "component_id"
    t.integer "photo_id"
  end

  create_table "kicad_components", :force => true do |t|
    t.string  "name"
    t.integer "kicad_housing_id"
    t.integer "component_id"
    t.date    "created_on"
    t.date    "updated_on"
  end

  create_table "kicad_housings", :force => true do |t|
    t.string "name"
  end

  create_table "order_states", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", :force => true do |t|
    t.integer  "prize_id"
    t.integer  "count"
    t.integer  "order_state_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", :force => true do |t|
    t.string   "name",       :limit => 30
    t.binary   "data",       :limit => 2097152
    t.string   "format",     :limit => 20
    t.integer  "x"
    t.integer  "y"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "prizes", :force => true do |t|
    t.decimal "value"
    t.integer "quantity"
    t.integer "component_id"
    t.integer "supplier_id"
    t.date    "begin"
    t.date    "end"
  end

  create_table "project_components", :force => true do |t|
    t.integer  "project_id"
    t.integer  "component_id"
    t.integer  "count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "project_states", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.integer  "project_state_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "path"
  end

# Could not dump table "sqlite_stat1" because of following StandardError
#   Unknown type '' for column 'tbl'

  create_table "stocks", :force => true do |t|
    t.integer  "component_id"
    t.integer  "count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "suppliers", :force => true do |t|
    t.string "name"
    t.string "url"
  end

end
