class ChangeProviderTypeToEnum < ActiveRecord::Migration[8.0]
  def change
    remove_column :daycare_providers, :provider_type, :string
    add_column :daycare_providers, :provider_type, :integer, default: 0, null: false
    add_index :daycare_providers, :provider_type
  end
end
