class MensagemsHaveAndBelongToManyCorretors < ActiveRecord::Migration
  def self.up
    create_table :mensagems_corretors, :id => false do |t|
      t.references :mensagem
      t.integer :corretor_id, :references => "pessoas"
    end
  end

  def down
    drop_table :mensagems_corretors
  end
end
