class ImovelCadPorRefUser < ActiveRecord::Migration
  def up
    # add a foreign key
     execute <<-SQL
       ALTER TABLE imovels
           ADD CONSTRAINT fk_imovels_cadastrador
           FOREIGN KEY (cadastrador_id)
           REFERENCES corretors(id)   
      SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE imovels
      DROP FOREIGN KEY fk_imovels_cadastrador
   SQL
  end
end