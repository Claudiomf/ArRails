class CreateCorretors < ActiveRecord::Migration
  def change
    create_table :corretors do |t|
      t.string :nome, limit: 300
      t.string :cpf, limit: 30
      t.string :rg, limit: 30
      t.string :creci, limit: 10
      t.string :telefone1, limit: 20
      t.string :telefone2, limit: 20
      
      t.timestamps
    end
  end
end
