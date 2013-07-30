class FixImovelsColumnsQuartosSuites < ActiveRecord::Migration
  def change
    change_table :imovels do |t|
      # Adicao de colunas
      t.integer :quantidade_quartos, :quantidade_suites
      
      # Renomeacao de colunas
      t.rename :imovel_transacao_id, :transacao_imovel_id
      t.rename :imovel_tipo_id, :tipo_imovel_id
      
      # Mudancas nas colunas
      t.change :codigo_referencia, :string, :limit => 10
      t.change :nome, :string, :limit => 200
      t.change :localizacao, :string, :limit => 200
      t.change :taxa_condominio, :numeric, :precision => 8, :scale => 2
      t.change :iptu, :numeric, :precision => 8, :scale => 2
      t.change :valor, :numeric, :precision => 9, :scale => 2
      t.change :area, :numeric, :precision => 7, :scale => 2
    end
  end
end
