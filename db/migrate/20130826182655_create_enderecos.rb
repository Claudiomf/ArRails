class CreateEnderecos < ActiveRecord::Migration
  def change
    create_table :enderecos do |t|
      t.string :logradouro, limit: 400
      t.string :bairro, limit: 100
      t.string :cidade, limit: 120
      t.string :estado, limit: 120
      
      # Foreign key
      t.integer :pessoa_id
      # t.integer :corretor_id, :references => "pessoas"

      t.timestamps
    end
  end
end
