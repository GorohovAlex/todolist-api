class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.references :project, foreign_key: { on_delete: :cascade }
      t.boolean :change, default: false
      t.datetime :deadline

      t.timestamps
    end
  end
end
