class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
    	t.string :name
    	t.integer :manager_id
    	t.references :city, foreign_key: true

      t.timestamps
    end
  end
end
