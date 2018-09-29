class CreatePublicationDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :publication_documents do |t|
      t.integer :publication
      t.integer :document

      t.timestamps
    end
  end
end
