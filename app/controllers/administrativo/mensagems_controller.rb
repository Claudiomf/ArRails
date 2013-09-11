# encoding: utf-8
class Administrativo::MensagemsController < Administrativo::CorretorController
  def index
    
    #@mensagems = Mensagem.order('created_at')
    #@mensagems = Mensagem.paginate :all, :page => params[:page], :per_page => 2
    @mensagems = Mensagem.paginate :page => params[:page], :order => 'created_at DESC', :per_page => 10
    
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
  
  # Acao que apaga um conjunto de mensagens da tela inicial que são selecionadas através de um checkbox
  def apagar_mensagens
    @mensagems = Mensagem.find(params[:mensagem_ids])
    
    @mensagems.each do |mensagem|
     mensagem.destroy
    end
      

    respond_to do |format|
      format.html { redirect_to administrativo_mensagems_url, :notice => 'As mensagens foram removidas com sucesso.' }
      format.json { head :ok }
    end
  end
  
end
