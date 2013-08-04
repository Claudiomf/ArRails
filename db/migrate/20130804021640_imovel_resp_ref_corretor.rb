class ImovelRespRefCorretor < ActiveRecord::Migration
  def change
    # Apagar a constraint fk_imovels_cadastrado_por
    execute("ALTER TABLE imovels DROP CONSTRAINT fk_imovels_cadastrado_por;")
    execute("ALTER TABLE imovels ADD CONSTRAINT fk_imovels_cadastrado_por FOREIGN KEY (cadastrado_por_id)
              REFERENCES corretors (id) MATCH SIMPLE
              ON UPDATE NO ACTION ON DELETE NO ACTION;")
    
    # Apagar a constraint fk_imovels_responsavel
    execute("ALTER TABLE imovels DROP CONSTRAINT fk_imovels_responsavel;")
    execute("ALTER TABLE imovels ADD CONSTRAINT fk_imovels_responsavel FOREIGN KEY (responsavel_id)
              REFERENCES corretors (id) MATCH SIMPLE
              ON UPDATE NO ACTION ON DELETE NO ACTION;")
    
    # Apagar a constraint fk_imovels_vendedor
    execute("ALTER TABLE imovels DROP CONSTRAINT fk_imovels_vendedor")
    execute("ALTER TABLE imovels ADD CONSTRAINT fk_imovels_vendedor FOREIGN KEY (vendedor_id)
              REFERENCES corretors (id) MATCH SIMPLE
              ON UPDATE NO ACTION ON DELETE NO ACTION;")
  end
end