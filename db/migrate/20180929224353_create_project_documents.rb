class CreateProjectDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :project_documents do |t|
      t.integer :idState
      t.integer :idProject
      t.boolean :approved
      t.integer :year
      t.integer :period

      t.timestamps
    end
  end
end
