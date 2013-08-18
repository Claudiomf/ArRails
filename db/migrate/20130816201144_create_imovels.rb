class CreateImovels < ActiveRecord::Migration
  def change
    create_table :imovels do |t|
      # Dados principais
      t.string :codigo_referencia, limit: 10
      t.string :nome, limit: 200
      t.string :localizacao, limit: 200
      t.text :descricao
      
      # Dados gerais
      t.column :taxa_condominio, :numeric, :precision => 8, :scale => 2
      t.column :iptu, :numeric, :precision => 8, :scale => 2
      t.column :valor, :numeric, :precision => 10, :scale => 2
      t.float :area
      t.integer :quantidade_quartos
      t.integer :quantidade_suites
      t.integer :vagas_garagem
      
      # Foreign Key
      t.belongs_to :transacao_imovel
      t.belongs_to :tipo_imovel
      
      # Administracao
      t.integer :vendedor_id, :references => "corretors"
      t.integer :cadastrador_id, :references => "corretors"
      
      t.boolean :vendido
      t.boolean :ativo
      
      t.timestamps
    end
  end
end
