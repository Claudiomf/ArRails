# encoding: utf-8
class Mensagem < ActiveRecord::Base

  belongs_to :tipo_mensagem, foreign_key: :tipo_mensagem_id
  has_and_belongs_to_many :corretors
  
  attr_accessible :tipo_mensagem_id, :remetente, :email, :celular, :assunto_mensagem,
                  :corpo_mensagem, :lida, :visualizada_por_ids
end
