class CreateInstitutions < ActiveRecord::Migration
  def change
    create_table :institutions do |t|
      t.string :name,         required: true
      t.string :role_name,    required: true

      t.timestamps null: false
    end
  end
end
