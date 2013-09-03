# encoding: utf-8
class Administrativo::MensagemsController < Administrativo::CorretorController
  def index
    
    @mensagems = Mensagem.order('created_at')
    
    respond_to do |format|
      format.html # index.html.erb
      #format.json { render :json => @corretors }
    end
  end
  
  def show
    
    # Verificar se o corretor logado já visualizou a mensagem, se não coloca ele na lista
    # de quem visualizou na tabela mensagems_corretors
    
    #Popular objeto mensagem
    @mensagem = Mensagem.find(params[:id])
    
    if !@mensagem.lida
      @mensagem.attributes = {:lida => 'true'}
    end
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mensagem }
    end
  end
  
end
