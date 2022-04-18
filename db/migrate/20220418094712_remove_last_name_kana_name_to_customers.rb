class RemoveLastNameKanaNameToCustomers < ActiveRecord::Migration[5.2]
  def change
    remove_column :customers, :last_name_kana_name, :string
  end
end
