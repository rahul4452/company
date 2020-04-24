class CreateEmployees < ActiveRecord::Migration[6.0]
  def change
    create_table :employees do |t|
      t.string :name
      t.integer :manager_id
      t.references :city, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
