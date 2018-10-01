class CreatePublicationImages < ActiveRecord::Migration[5.0]
  def change
    create_table :publication_images do |t|
      t.integer :idPublication
      t.integer :idImage

      t.timestamps
    end
  end
end
