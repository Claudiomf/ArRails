class RemoveRefCorretorUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      # Add Ref user
      #t.integer :corretor_id
      
      # Remove Ref user
      t.remove :corretor_id
    end
  end
end
