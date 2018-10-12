class CreatePublications < ActiveRecord::Migration[5.0]
  def change
    create_table :publications do |t|
      t.string :name
      t.text :description
      t.datetime :startDate
      t.datetime :endDate
      t.string :place
      t.float :latitude
      t.float :longitude
      t.integer :idType
      t.integer :idUser
      t.integer :parent

      t.timestamps
    end
  end
end
