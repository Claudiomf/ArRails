class CreatePessoas < ActiveRecord::Migration
  def change
    create_table :pessoas do |t|
      # Especifica o tipo
      t.integer :tipo
      
      # Atributos
      t.string :nome, limit: 300
      t.string :cpf, limit: 30
      t.string :cnpj, limit: 30
      t.string :rg, limit: 30
      t.string :creci, limit: 10
      t.string :inscricao_estadual, limit: 80
      t.string :email, limit: 200
      t.string :sexo, limit: 1
      t.string :telefone1, limit: 20
      t.string :telefone2, limit: 20
      
      # Foreign key
      #t.integer :corretor_id
      
      t.timestamps
    end
    
    #adicionando o indice
    add_index :pessoas, [:id, :tipo]
  end
end
