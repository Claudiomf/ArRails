class AddRefUserCorretor < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.integer :corretor_id
    end
  end
end
