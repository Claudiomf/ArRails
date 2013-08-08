class AddForeignKeyCorretor < ActiveRecord::Migration
  def change
    change_table :corretors do |t|
      # Add Ref user
      t.references :user
    end
  end
end
