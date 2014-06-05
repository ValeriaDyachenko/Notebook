class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.boolean :execution_status
      t.boolean :urgency_status
      t.date :completion_date
      t.references :todopage, index: true

      t.timestamps
    end
  end
end
