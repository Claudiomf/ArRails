class CreateEnderecos < ActiveRecord::Migration
  def change
    create_table :enderecos do |t|
      t.string :logradouro, limit: 400
      t.string :bairro, limit: 100
      t.string :cidade, limit: 120

      t.timestamps
    end
  end
  
  def up
    execute <<-SQL
        ALTER TABLE enderecos
           ADD CONSTRAINT fk_corretors
           FOREIGN KEY (corretor_id)
           REFERENCES corretors(id)   
      SQL
  end

  def down
     execute <<-SQL
        ALTER TABLE enderecos
        DROP FOREIGN KEY fk_corretors
     SQL
  end
end
