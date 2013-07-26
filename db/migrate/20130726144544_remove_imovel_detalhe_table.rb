class RemoveImovelDetalheTable < ActiveRecord::Migration
  def up
  end

  def down
    drop_table :imovel_detalhes
  end
end
