ActiveRecord::Schema.define(version: 2022_02_18_104020) do

  enable_extension "plpgsql"

  create_table "tasks", force: :cascade do |t|
    t.string "text"
    t.boolean "complete"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
