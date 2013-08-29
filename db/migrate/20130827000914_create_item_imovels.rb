class CreateItemImovels < ActiveRecord::Migration
  def change
    create_table :item_imovels do |t|
      # Dados gerais
      t.boolean :visibilidade
      t.string :quantidade, limit: 60
      
      # Dados associativos: vai gerar a coluna imovel_id, caracteristica_imovel_id
      t.belongs_to :imovel
      t.belongs_to :caracteristica_imovel
      
      t.timestamps
    end
  end
end