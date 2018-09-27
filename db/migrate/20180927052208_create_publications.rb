class CreatePublications < ActiveRecord::Migration[5.0]
  def change
    create_table :publications do |t|
      t.string :name
      t.text :description
      t.datetime :startdate
      t.datetime :enddate
      t.string :place
      t.double :latitude
      t.double :longitude
      t.integer :type
      t.integer :user
      t.integer :parent

      t.timestamps
    end
  end
end
