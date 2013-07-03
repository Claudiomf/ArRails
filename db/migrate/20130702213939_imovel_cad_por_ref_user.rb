class ImovelCadPorRefUser < ActiveRecord::Migration
  def up
    # add a foreign key
     execute <<-SQL
       ALTER TABLE imovels
           ADD CONSTRAINT fk_imovels_cadastrado_por
           FOREIGN KEY (cadastrado_por_id)
           REFERENCES users(id)   
      SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE imovels
      DROP FOREIGN KEY fk_imovels_responsavel
   SQL
  end
end