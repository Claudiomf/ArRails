class CreateTipoMensagems < ActiveRecord::Migration
  def change
    create_table :tipo_mensagems do |t|
      t.string :descricao, limit: 60

      t.timestamps
    end
  end
end
