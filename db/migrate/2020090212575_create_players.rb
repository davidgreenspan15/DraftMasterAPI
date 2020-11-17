class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :name
      t.string :position
      t.integer :depth
      t.boolean :doublep
      t.string :team
      t.boolean :injured
      t.string :formation
      t.integer :bye
      t.string :notes
      t.float :gfanpts
      t.float :gyds_pass
      t.float :gtds_pass
      t.float :grec_rec
      t.float :gyds_rec
      t.float :gtds_rec
      t.float :gatt_rush
      t.float :gyds_rush
      t.float :gtds_rush
      t.integer :yfanpts
      t.integer :yyds_pass
      t.integer :ytds_pass
      t.integer :yrec_rec
      t.integer :yyds_rec
      t.integer :ytds_rec
      t.integer :yatt_rush
      t.integer :yyds_rush
      t.integer :ytds_rush

      t.timestamps
    end
  end
end
