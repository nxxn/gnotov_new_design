class AddEnDepartmentToWorks < ActiveRecord::Migration
  def change
    add_column :works, :en_department, :string, default: ""
    add_column :works, :lv_department, :string, default: ""
  end
end
