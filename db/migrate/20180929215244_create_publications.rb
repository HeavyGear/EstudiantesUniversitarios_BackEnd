class CreatePublications < ActiveRecord::Migration[5.0]
  def change
    create_table :publications do |t|
      t.string :name
      t.text :description
      t.datetime :startdate
      t.string :place
      t.float :latitude
      t.float :longitude

      t.belongs_to :user, index: true
      t.belongs_to :type_publication, index: true

      t.timestamps
    end
  end
end
