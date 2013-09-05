class CreateMensagems < ActiveRecord::Migration
  def change
    create_table :mensagems do |t|
      
      # Foreign key
      t.integer :tipo_mensagem_id
      
      t.string :remetente
      t.string :email
      t.string :telefone
      
      t.string :assunto_mensagem
      t.text :corpo_mensagem
      
      t.boolean :lida, :null => false, :default => 'false'
      
      t.timestamps
    end
  end
end
