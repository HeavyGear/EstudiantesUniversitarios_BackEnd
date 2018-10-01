class CreateProjectDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :project_documents do |t|
      t.integer :idState
      t.integer :idDocument
      t.integer :idProject

      t.timestamps
    end
  end
end
