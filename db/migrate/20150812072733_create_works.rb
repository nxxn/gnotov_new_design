class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.string     :title, default: ""
      t.string     :url, default: ""
      t.text       :description, default: ""
      t.text       :department, default: ""
      t.boolean    :active, default: false
      t.integer    :order_number

      t.boolean    :ru, default: false
      t.boolean    :lv, default: false
      t.boolean    :en, default: false

      t.attachment :work_image

      t.timestamps null: false
    end
  end
end
