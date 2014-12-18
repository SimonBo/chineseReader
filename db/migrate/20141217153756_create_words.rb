class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :traditional_char
      t.string :simplified_char
      t.string :pronunciation
      t.string :meaning

      t.timestamps
    end
  end
end
