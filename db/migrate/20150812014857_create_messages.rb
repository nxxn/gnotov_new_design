class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :email
      t.string :name
      t.text :message
      t.string :status

      t.timestamps
    end
  end
end
