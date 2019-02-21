class AddwillingToRelocateToEmployee < ActiveRecord::Migration[5.2]
  def change
  	add_column :employees, :willing_to_relocate, :boolean, :default => false
  end
end
