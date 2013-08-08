class RemoveRefUserCorretor < ActiveRecord::Migration
  def change
    change_table :corretors do |t|
      # Add Ref user
      #t.integer :corretor_id
      
      # Remove Ref user
      t.remove :user_id
    end
    change_table :users do |t|
      # Add Ref user
      t.references :corretor
    end
  end
end
