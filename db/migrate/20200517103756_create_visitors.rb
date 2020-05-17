class CreateVisitors < ActiveRecord::Migration[5.2]
  def change
    create_table :visitors do |t|
      t.string :device_id
      t.date :visit_date
      t.numeric :institutionId

      t.timestamps
    end
  end
end
