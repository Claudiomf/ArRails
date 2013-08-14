# Foi criada com a finalidade de acrescentar a coluna 'contador_tipo_imovel' na tabela 'imovels_tipo'
#class AddContadorTipoImovel < ActiveRecord::Migration
 # def up
    # Make sure no null value exist
  #  ImovelTipo.update_all({:contador_tipo_imovel => 0}, {:contador_tipo_imovel => nil})
    
    # Change the column to not allow null
   # change_column :imovel_tipos, :contador_tipo_imovel, :integer, :null => false
  #end
    
  #def down
   # remove_column :contador_tipo_imovel
  #end
#end
