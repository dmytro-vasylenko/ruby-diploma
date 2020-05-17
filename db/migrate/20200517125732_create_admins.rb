class CreateAdmins < ActiveRecord::Migration[5.2]
  def change
    create_table :admins do |t|
      t.string :name
      t.references :institution, foreign_key: true

      t.timestamps
    end
  end
end
