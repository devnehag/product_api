class RemoveCategoryIdFromProducts < ActiveRecord::Migration[7.1]
  def change
    remove_reference :products, :category, null: false, foreign_key: true
  end
end
