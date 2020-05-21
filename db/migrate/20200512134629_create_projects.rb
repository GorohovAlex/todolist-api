class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.references :user, foreign_key: { on_delete: :cascade }

      t.timestamps
    end
  end
end
