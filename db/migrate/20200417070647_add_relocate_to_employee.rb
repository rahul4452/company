class AddRelocateToEmployee < ActiveRecord::Migration[6.0]
  def change
    add_column :employees, :willing_to_relocate, :boolean, default: false
  end
end
