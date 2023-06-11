class RemoveItemIndex < ActiveRecord::Migration[7.0]
  def change
    remove_index :items, name: "index_items_on_name"
  end
end
