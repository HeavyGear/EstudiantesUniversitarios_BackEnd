class CreateUserProjectDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :user_project_documents do |t|
      t.integer :user
      t.integer :projectDocument
      t.string :description
      t.string :answer

      t.timestamps
    end
  end
end
