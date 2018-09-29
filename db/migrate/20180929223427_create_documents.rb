class CreateDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :documents do |t|
      t.string :link
      t.integer :documetable_id
      t.string :documentable_type

      t.timestamps
    end
  end
end
