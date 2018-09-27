class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.integer :user
      t.integer :supervisor
      t.integer :state

      t.timestamps
    end
  end
end
