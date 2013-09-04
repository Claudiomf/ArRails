# encoding: utf-8
class Mensagem < ActiveRecord::Base

  belongs_to :tipo_mensagem, foreign_key: :tipo_mensagem_id
  
  # Corretor visualiza
  has_and_belongs_to_many :corretors
  
  attr_accessible :tipo_mensagem_id, :remetente, :email, :celular, :assunto_mensagem,
                  :corpo_mensagem, :lida, :visualizada_por_ids
                  
  def visualizou(corretor)
    if self.corretors.empty? or corretors.where('corretor_id = '+ corretor.id.to_s).empty?
      self.visualizou_mensagem(corretor)
    end
  end
  
  # Método que acrescenta o corretor que está visualizando a imagem à lista de quem visualizou.
  def visualizou_mensagem(corretor)
    self.corretors<<(corretor)
  end
end
