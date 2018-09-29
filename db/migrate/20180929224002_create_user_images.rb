class CreateUserImages < ActiveRecord::Migration[5.0]
  def change
    create_table :user_images do |t|
      t.integer :user
      t.integer :image

      t.timestamps
    end
  end
end
