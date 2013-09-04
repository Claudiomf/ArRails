class MensagemsHaveAndBelongToManyCorretors < ActiveRecord::Migration
  def self.up
    create_table :corretors_mensagems, :id => false do |t|
      t.integer :corretor_id, :references => "pessoas"
      t.references :mensagem
    end
  end

  def down
    drop_table :corretors_mensagems
  end
end
