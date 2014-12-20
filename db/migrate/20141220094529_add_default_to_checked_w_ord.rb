class AddDefaultToCheckedWOrd < ActiveRecord::Migration
  def change
    change_column :checked_words, :counter, :integer, default: 0
  end
end
