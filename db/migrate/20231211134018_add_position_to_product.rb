class AddPositionToProduct < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :position, :integer
    product.order(:updated_at).each.with_index(1) do |todo_item, index|
      todo_item.update_column :position, index
    end
  end
end
