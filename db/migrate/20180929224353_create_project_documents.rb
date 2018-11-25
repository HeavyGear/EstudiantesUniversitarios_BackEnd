class CreateProjectDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :project_documents do |t|
      t.belongs_to :document_state, index: true
      t.belongs_to :project, index: true

      t.integer :year
      t.integer :period

      t.timestamps
    end
  end
end
