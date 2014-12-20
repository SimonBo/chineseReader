class CreateCheckedWords < ActiveRecord::Migration
  def change
    create_table :checked_words do |t|
      t.references :word, index: true
      t.references :user, index: true
      t.integer :counter

      t.timestamps
    end
  end
end
