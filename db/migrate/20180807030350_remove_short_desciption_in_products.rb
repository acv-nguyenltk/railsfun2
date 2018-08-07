class RemoveShortDesciptionInProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :short_desciption, :string
  end
end
