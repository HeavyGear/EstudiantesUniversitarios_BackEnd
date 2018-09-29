class CreateProjectDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :project_documents do |t|
      t.integer :state
      t.integer :document
      t.integer :project

      t.timestamps
    end
  end
end
