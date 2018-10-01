class CreatePublicationDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :publication_documents do |t|
      t.integer :idPublication
      t.integer :idDocument

      t.timestamps
    end
  end
end
