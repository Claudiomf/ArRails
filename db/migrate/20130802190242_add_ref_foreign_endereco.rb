class AddRefForeignEndereco < ActiveRecord::Migration
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
