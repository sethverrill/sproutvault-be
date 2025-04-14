class AddOtherDescriptionToDaycareProviders < ActiveRecord::Migration[8.0]
  def change
    add_column :daycare_providers, :other_description, :string
  end
end
