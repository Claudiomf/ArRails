# encoding: utf-8
class Administrativo::MensagemsController < Administrativo::CorretorController
  def index
    
    @mensagems = Mensagem.order('created_at')
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @mensagems }
    end
  end
  
  def show
    
    #Popular objeto mensagem
    @mensagem = Mensagem.find(params[:id])
    
    # Verificar se o corretor logado já visualizou a mensagem, se não coloca ele na lista
    # de quem visualizou na tabela mensagems_corretors
    @mensagem.visualizou(current_user.corretor)
    
    if !@mensagem.lida
      @mensagem.update_attributes :lida => 'true'
      #@mensagem.attributes = {:lida => 'true'}
    end
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mensagem }
    end
  end
  
  def apagar_mensagens
    
  end
  
end
