class CreatePessoas < ActiveRecord::Migration
  def change
    create_table :pessoas do |t|
      # Implementacao do STI
      t.integer :tipo
      
      # Atributos de Pessoa
      t.string :nome, limit: 300
      t.string :telefone1, limit: 20
      t.string :telefone2, limit: 20
      t.string :email, limit: 200
      
      # Atributos de Pessoa Fisica
      t.string :cpf, limit: 30
      t.string :rg, limit: 30
      t.string :sexo, limit: 1
      
      # Atributos de Corretor
      # t.string :creci, limit: 10
      
      # Foreign key
      t.integer :corretor_id
      
      t.timestamps
    end
    
    #adicionando o indice
    add_index :pessoas, [:id, :tipo]
  end
end
