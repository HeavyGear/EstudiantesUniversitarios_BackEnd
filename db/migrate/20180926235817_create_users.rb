class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :idNumber
      t.string :email
      t.boolean :beneficiary
      t.integer :role
      t.integer :project
      t.integer :university
      t.integer :major
      t.integer :image

      t.timestamps
    end
  end
end