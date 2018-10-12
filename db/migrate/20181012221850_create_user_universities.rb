class CreateUserUniversities < ActiveRecord::Migration[5.0]
  def change
    create_table :user_universities do |t|
      t.belongs_to :user, index: true
      t.belongs_to :university, index: true
      t.integer :idMajor

      t.timestamps
    end
  end
end
