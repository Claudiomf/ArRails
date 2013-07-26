class CreateCaracteristicaImovels < ActiveRecord::Migration
  def change
    create_table :caracteristica_imovels do |t|
      
      t.string :descricao, limit: 300
      t.integer :contador
      
      t.timestamps
    end
  end
end
