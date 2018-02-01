class AddDefaultValueToDone < ActiveRecord::Migration[5.1]
  def change
    # 修改欄位型別：change_column(table_name, column_name, type, options)
    change_column(:tasks, :done, :boolean, :default => false)
  end
end
