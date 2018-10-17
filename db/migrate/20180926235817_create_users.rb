class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :idNumber
      t.string :email
      t.boolean :beneficiary
      t.string :password_digest # Almacena la contraseña, la cuál fue previamente cifrada

      t.belongs_to :role, index: true

      t.timestamps
    end
  end
end
