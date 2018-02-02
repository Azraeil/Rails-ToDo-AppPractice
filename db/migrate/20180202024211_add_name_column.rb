class AddNameColumn < ActiveRecord::Migration[5.1]
  def change
    add_column(:tasks, :name, :text)
  end
end
