class CreateItemImovels < ActiveRecord::Migration
  def change
    create_table :item_imovels do |t|
      # Dados gerais
      t.boolean :visibilidade
      t.string :quantidade, limit: 60
      
      # Dados associativos
      t.belongs_to :imovel
      t.belongs_to :caracteristica_imovel
      
      t.timestamps
    end
  end
end
