class CreateTransacaoImovels < ActiveRecord::Migration
  def change
    create_table :transacao_imovels do |t|
      t.string :descricao, limit: 100

      t.timestamps
    end
  end
end
