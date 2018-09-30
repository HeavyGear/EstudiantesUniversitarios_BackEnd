class CreateUserMajorUniversities < ActiveRecord::Migration[5.0]
  def change
    create_table :user_major_universities do |t|
      t.integer :user
      t.integer :major
      t.integer :university

      t.timestamps
    end
  end
end
