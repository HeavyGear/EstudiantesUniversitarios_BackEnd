class CreateUserMajorUniversities < ActiveRecord::Migration[5.0]
  def change
    create_table :user_major_universities do |t|
      t.integer :idUser
      t.integer :idMajor
      t.integer :idUniversity

      t.timestamps
    end
  end
end
