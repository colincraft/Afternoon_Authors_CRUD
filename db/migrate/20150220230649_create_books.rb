class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.integer :author_id
      t.references :writer

      t.timestamps null: false
    end
  end
end
