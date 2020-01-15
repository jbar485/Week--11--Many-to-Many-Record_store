class AddArtistsAndJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      # We can use t.string instead of t.column. This means we don't need to do this: t.column (:name, :string)
      t.string :name
      t.timestamps
    end

    create_table :albums_artists, id: false do |t|
      t.belongs_to :artist, index: true
      t.belongs_to :album, index: true
    end
  end
end
