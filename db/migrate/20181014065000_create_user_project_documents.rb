class CreateUserProjectDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :user_project_documents do |t|
      t.belongs_to :user, index: true
      t.belongs_to :project_document, index: true
      
      t.datetime :revisionDate
      t.text :comment
      t.text :response

      t.timestamps
    end
  end
end
