class CreateBagbloods < ActiveRecord::Migration[7.2]
  def change
    create_table :bagbloods do |t|
      t.decimal :volume
      t.references :donor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
