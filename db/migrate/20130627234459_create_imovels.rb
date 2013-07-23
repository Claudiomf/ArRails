class CreateImovels < ActiveRecord::Migration
  def change
    create_table :imovels do |t|
      # Dados principais
      t.string :cod_ref
      t.string :nome
      t.string :localizacao
      t.text :descricao
      
      # Dados gerais
      t.integer :taxa_de_condominio
      t.integer :iptu
      t.integer :valor
      t.integer :quartos
      t.integer :suites
      t.integer :area
      t.integer :vagas
      t.references :imovel_transacao
      t.references :imovel_tipo
      
      # Administracao
      t.integer :responsavel_id
      t.integer :vendedor_id
      t.integer :cadastrado_por_id
      t.boolean :vendido
      t.boolean :ativo
      
      t.timestamps
    end
  end
end
