class ImovelRespRefUser < ActiveRecord::Migration
  def up
    execute <<-SQL
        ALTER TABLE imovels
           ADD CONSTRAINT fk_imovels_responsavel
           FOREIGN KEY (responsavel_id)
           REFERENCES corretors(id)   
      SQL
  end

  def down
     execute <<-SQL
        ALTER TABLE imovels
        DROP FOREIGN KEY fk_imovels_responsavel
     SQL
  end
end
