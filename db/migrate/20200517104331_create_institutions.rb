class CreateInstitutions < ActiveRecord::Migration[5.2]
  def change
    create_table :institutions do |t|
      t.string :name
      t.string :location
      t.numeric :administrator
      t.string :description

      t.timestamps
    end
  end
end
