class ImovelsHaveAndBelongToManyDetalhes < ActiveRecord::Migration
  def up
     create_table :detalhes_imovels, :id => false do |t|
      t.references :imovel_detalhe, :imovel
    end
  end

  def down
    drop_table :roles_users
  end
end
