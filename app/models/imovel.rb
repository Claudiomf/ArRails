class Imovel < ActiveRecord::Base
  has_and_belongs_to_many :imovel_detalhes
  belongs_to :users
  #<%= radio_button_tag'imovel[imovel_transacao_id]', c.id %><%= c.nome %>
    
   #<% ImovelTansacao.find(:all).each do |c| %>
   #   <%= radio_button("imovel" , "imovel_transacao_id" , c.id) %>
   #<% end %>
  
  
  attr_accessible :cod_ref, :nome, :localizacao, :descricao, :taxa_de_condominio, :iptu, 
                  :quartos, :suites, :area, :vagas, :imovel_detalhe_ids, :imovel_transacao_id, 
                  :imovel_tipo_id, :responsavel_id, :cadastrado_por_id, :vendedor_id,
                  :vendido, :ativo
                  
#  before_save :setup_corretor
  
#  def setup_corretor
#      self.cadastrado_por_id = current_user.id 
#  end
end
