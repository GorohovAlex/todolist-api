class CreateTaskComments < ActiveRecord::Migration[6.0]
  def change
    create_table :task_comments do |t|
      t.references :task, foreign_key: { on_delete: :cascade }

      t.timestamps
    end
  end
end