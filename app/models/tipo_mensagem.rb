# encoding: utf-8
class TipoMensagem < ActiveRecord::Base
  
  ATENDIMENTO = 1
  ENCOMENDA_IMOVEL = 2
  ANUNCIO_IMOVEL = 3
  SOLICITACAO_CADASTRO_IMOVEL = 4
  OUTRO = 5
  
  has_many :mensagems
  
  attr_accessible :descricao
end
