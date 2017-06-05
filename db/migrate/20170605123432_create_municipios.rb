class CreateMunicipios < ActiveRecord::Migration[5.0]
  def change
    create_table :municipios do |t|
      t.integer :code
      t.string :name
      t.integer :status
      t.references :region, foreign_key: true

      t.timestamps
    end
  end
end
