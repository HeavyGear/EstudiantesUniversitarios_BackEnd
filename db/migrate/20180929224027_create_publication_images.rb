class CreatePublicationImages < ActiveRecord::Migration[5.0]
  def change
    create_table :publication_images do |t|
      t.integer :publication
      t.integer :image

      t.timestamps
    end
  end
end
