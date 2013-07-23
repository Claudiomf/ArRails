class ImovelsHaveAndBelongToManyDetalhes < ActiveRecord::Migration
  def up
     create_table :imovel_detalhes_imovels, :id => false do |t|
      t.references :imovel_detalhe, :imovel
    end
  end

  def down
    drop_table :movel_detalhes_imovels
  end
end
