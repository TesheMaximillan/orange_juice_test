class CreateSearchItems < ActiveRecord::Migration[7.0]
  def change
    create_table :search_items do |t|
      t.references :user, null: false, foreign_key: true
      t.string :text, null: false
      t.integer :rank, null: false, default: 1

      t.timestamps
    end
  end
end
