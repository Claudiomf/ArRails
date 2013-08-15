class CreateTipoImovels < ActiveRecord::Migration
  def change
    create_table :tipo_imovels do |t|
      t.string :nome, limit: 60
      t.integer :contador_tipo_imovel, :null => false, :default => 0

      t.timestamps
    end
  end
end
