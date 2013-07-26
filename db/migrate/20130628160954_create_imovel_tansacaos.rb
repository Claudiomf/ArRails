class CreateImovelTansacaos < ActiveRecord::Migration
  def change
    create_table :imovel_tansacaos do |t|
      t.string :nome

      t.timestamps
    end
  end
end
