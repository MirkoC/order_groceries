class CreateBuildings < ActiveRecord::Migration
  def change
    create_table :buildings do |t|
      t.string :name,                   required: true
      t.string :role_name,              required: true
      t.belongs_to :institution,       index: true,        foreign_key:true,         required: true

      t.timestamps null: false
    end
  end
end
