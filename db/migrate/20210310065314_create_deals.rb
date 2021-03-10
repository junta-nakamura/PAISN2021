class CreateDeals < ActiveRecord::Migration[6.0]
  def change
    create_table :deals do |t|
      t.references :user,       foreignkey: true
      t.references :experience, foreignkey: true
      t.timestamps
    end
  end
end