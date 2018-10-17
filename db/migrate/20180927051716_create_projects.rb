class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description

      t.references :user
      t.references :supervisor
     
      t.belongs_to :project_state, index: true

      t.timestamps
    end
  end
end
