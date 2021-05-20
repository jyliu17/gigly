class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.belongs_to :artist, null: false, foreign_key: {on_delete: :cascade}
      t.belongs_to :creator, null: false, foreign_key: {on_delete: :cascade}
      t.integer :rating
      t.string :description
      t.string :title

      t.timestamps
    end
  end
end
