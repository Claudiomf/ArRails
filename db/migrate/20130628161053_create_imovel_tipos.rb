class CreateImovelTipos < ActiveRecord::Migration
  def change
    create_table :imovel_tipos do |t|
      t.string :nome

      t.timestamps
    end
  end
end
