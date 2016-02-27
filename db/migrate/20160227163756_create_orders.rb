class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.boolean :archived,                                required: true,         default: false
      t.belongs_to :building,                             required: true,         index: true,        foreign_key: true
      t.references :created_by, references: :users,       required: true,         index: true
      t.references :updated_by, references: :users,       required: true,         index: true

      t.timestamps null: false
    end
  end
end
