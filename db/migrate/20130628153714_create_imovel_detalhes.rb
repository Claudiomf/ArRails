class CreateImovelDetalhes < ActiveRecord::Migration
  def change
    create_table :imovel_detalhes do |t|
      t.string :nome

      t.timestamps
    end
  end
end
