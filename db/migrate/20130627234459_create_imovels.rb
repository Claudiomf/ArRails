class CreateImovels < ActiveRecord::Migration
  def change
    create_table :imovels do |t|
      t.string :cod_ref
      t.string :nome
      t.string :localizacao
      t.text :descricao
      t.integer :imovel_dados_gerais_id
      t.integer :imovel_adm_id

      t.timestamps
    end
  end
end
