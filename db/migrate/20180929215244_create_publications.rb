class CreatePublications < ActiveRecord::Migration[5.0]
  def change
    create_table :publications do |t|
      t.string :name
      t.text :description
      t.datetime :startdate
      t.datetime :enddate
      t.string :place
      t.float :latitude
      t.float :longitude
      t.integer :typePublication
      t.integer :idUser
      t.integer :parent

      t.timestamps
    end
  end
end
