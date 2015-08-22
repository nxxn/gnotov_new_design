class AddTriggerButtonToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :trigger_button, :string, default: ""
  end
end
