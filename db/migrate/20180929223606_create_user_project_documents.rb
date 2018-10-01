class CreateUserProjectDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :user_project_documents do |t|
      t.integer :idUser
      t.integer :idProjectDocument
      t.text :description
      t.text :answer

      t.timestamps
    end
  end
end
