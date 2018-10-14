class CreateDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :documents do |t|
      t.string :content
      t.references :uploadeable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
