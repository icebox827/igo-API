# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_210_529_213_925) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'booked_cars', force: :cascade do |t|
    t.integer 'user_id'
    t.integer 'car_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['car_id'], name: 'index_booked_cars_on_car_id'
    t.index ['user_id'], name: 'index_booked_cars_on_user_id'
  end

  create_table 'cars', force: :cascade do |t|
    t.string 'make'
    t.string 'model'
    t.integer 'year'
    t.string 'color'
    t.string 'transmission'
    t.string 'image_url'
    t.integer 'seats'
    t.integer 'user_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['user_id'], name: 'index_cars_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'username'
    t.string 'password_digest'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'email'
    t.boolean 'admin', default: false
  end

  add_foreign_key 'cars', 'users'
end
