class AddReferrerToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :referrer, :string, default: ""
  end
end
