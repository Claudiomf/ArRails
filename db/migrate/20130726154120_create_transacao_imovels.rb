class CreateTransacaoImovels < ActiveRecord::Migration
  def change
    create_table :transacao_imovels do |t|
      t.string :descricao, limit: 180

      t.timestamps
    end
  end
end
