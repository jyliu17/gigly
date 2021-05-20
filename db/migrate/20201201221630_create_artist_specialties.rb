class CreateArtistSpecialties < ActiveRecord::Migration[6.0]
  def change
    create_table :artist_specialties do |t|
      t.belongs_to :artist, null: false, foreign_key: {on_delete: :cascade}
      t.belongs_to :specialty, null: false, foreign_key: {on_delete: :cascade}

      t.timestamps
    end
  end
end
