class CreateDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :documents do |t|
      t.string :link
      t.integer :documentable_id
      t.string :documentable_type

      t.timestamps
    end

    add_index :documents, [:documentable_type, :documetable_id]
  end
end
