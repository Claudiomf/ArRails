class AddRefEndereco < ActiveRecord::Migration
  def change
    change_table :enderecos do |t|
      t.integer :corretor_id
    end
  end
end
