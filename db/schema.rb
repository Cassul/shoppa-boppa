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

ActiveRecord::Schema.define(version: 20180508043332) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "order_items", force: :cascade do |t|
    t.integer "quantity"
    t.string "price"
    t.string "total_discount"
    t.bigint "shop_id"
    t.bigint "order_id"
    t.bigint "product_id"
    t.bigint "product_variant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_items_on_order_id"
    t.index ["product_id"], name: "index_order_items_on_product_id"
    t.index ["product_variant_id"], name: "index_order_items_on_product_variant_id"
    t.index ["shop_id"], name: "index_order_items_on_shop_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "order_id"
    t.string "processed_at"
    t.string "currency"
    t.string "total_price"
    t.string "total_price_usd"
    t.string "token"
    t.string "total_tax"
    t.bigint "shop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id"], name: "index_orders_on_shop_id"
  end

  create_table "product_variants", force: :cascade do |t|
    t.string "variant_id"
    t.string "variant_title"
    t.string "sku"
    t.string "name"
    t.string "cost"
    t.integer "sales"
    t.bigint "shop_id"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "price"
    t.index ["product_id"], name: "index_product_variants_on_product_id"
    t.index ["shop_id"], name: "index_product_variants_on_shop_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "product_id"
    t.string "title"
    t.string "vendor"
    t.integer "sales"
    t.bigint "shop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id"], name: "index_products_on_shop_id"
  end

  create_table "shops", force: :cascade do |t|
    t.string "shopify_domain", null: false
    t.string "shopify_token", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shopify_domain"], name: "index_shops_on_shopify_domain", unique: true
  end

  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "product_variants"
  add_foreign_key "order_items", "products"
  add_foreign_key "order_items", "shops"
  add_foreign_key "orders", "shops"
  add_foreign_key "product_variants", "products"
  add_foreign_key "product_variants", "shops"
  add_foreign_key "products", "shops"
end
