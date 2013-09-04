class CreateMensagems < ActiveRecord::Migration
  def change
    create_table :mensagems do |t|
      
      # Foreign key
      t.integer :tipo_mensagem_id
      
      t.string :remetente
      t.string :email
      t.string :telefone
      
      t.string :assunto_mensagem
      t.string :corpo_mensagem
      
      t.boolean :lida
      
      t.timestamps
    end
  end
end
