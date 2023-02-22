class CreateDepartments < ActiveRecord::Migration[7.0]
  def change
    create_table :departments do |t|
      t.string :title, null: false
      t.text :notes

      t.timestamps
    end
  end
end
