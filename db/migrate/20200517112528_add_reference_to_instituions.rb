class AddReferenceToInstituions < ActiveRecord::Migration[5.2]
  def change
    remove_column :visitors, :institutionId
    add_reference :visitors, :institution
  end
end
