class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :name
      t.string :author
      t.integer :price
      t.integer :status, default: 0, null: false
      t.integer :borrowed_by_id
      t.references :library, null: false, foreign_key: true

      t.timestamps
    end
  end
end
