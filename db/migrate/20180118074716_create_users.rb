class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :mail
      t.string :gender
      t.integer :age
      
      t.timestamps
    end
  end
end
