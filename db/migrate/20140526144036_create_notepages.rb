class CreateNotepages < ActiveRecord::Migration
  def change
    create_table :notepages do |t|
      t.string :title
      t.text :description
      t.references :notesection, index: true

      t.timestamps
    end
  end
end
