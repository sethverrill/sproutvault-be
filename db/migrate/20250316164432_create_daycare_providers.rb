class CreateDaycareProviders < ActiveRecord::Migration[8.0]
  def change
    create_table :daycare_providers do |t|
      t.string :name
      t.string :provider_type

      t.timestamps
    end
  end
end
