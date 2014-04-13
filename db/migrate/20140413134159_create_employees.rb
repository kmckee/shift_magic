class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.string :mobile_phone_number
      t.string :email

      t.timestamps
    end
  end
end
