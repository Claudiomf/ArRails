# encoding: utf-8
class Administrativo::ImovelsController < Administrativo::CorretorController
  load_and_authorize_resource
  
  # GET /imovels
  # GET /imovels.json
  def index
    #@imovels = Imovel.all
   
   #Traz apenas os imoveis ativos
   @imovels = Imovel.all.select { |i| i.ativo == true }
   
  # Mapa para guardar os valores das transacoes associadas a cada imovel.
  # key: imovel_id, value: lista com [0]:transacao, [1]: tipos, [2] responsavel
  @hash_informacoes_imoveis = Hash.new
   
   @imovels.each do |imovel|
     popular_imovel(imovel)
   end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @imovels }
    end
  end

  # GET /imovels/1
  # GET /imovels/1.json
  def show
    #Popular objeto imovel
    @imovel = Imovel.find(params[:id])
    popular_imovel(nil)
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @imovel }
    end
  end

  # GET /imovels/new
  # GET /imovels/new.json
  def new
    
    ## Não deixa cadastrar e manda a mensagem que precisa ser um corretor. O root não pode cadastrar imoveis
    if current_user.id == Imovel::ADMIN_ROOT_ID
      return
    end
    @imovel = Imovel.new
    @imovel.images.build
    
    @imovel.item_imovels.build
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @imovel }
    end
  end

  # GET /imovels/1/edit
  def edit
    @imovel = Imovel.find(params[:id])
    @imovel.images.build
  end

  # POST /imovels
  # POST /imovels.json
  def create

    @imovel = Imovel.new(params[:imovel])
    
    @imovel.attributes = {:cadastrador_id => current_user.corretor.id } if !current_user.corretor.nil?     
    @imovel.attributes = {:ativo => true}
    
    #@caracteristica_imovel.increment!(:contador)
    
    if has_role?(current_user, 'corretor')
      @imovel.attributes = {:ativo => false}
    end
    
    # arranjo temporario porque não tá cadastrando com nome quando é terreno
    if @imovel.tipo_imovel_id == TipoImovel::TERRENO
      @imovel.attributes = {:nome => "TERRENO LOCALIZADO: "+@imovel.localizacao}
      
      # Zera os atributos abaixo
      @imovel.attributes = {:quartos => '0'}
      @imovel.attributes = {:suites => '0'}
      @imovel.attributes = {:vagas => '0'}
      @imovel.attributes = {:item_imovel_ids => []}
    end
    
    # Para as buscas no site
    #@imovel.caracteristica_imovels.each do |caracteristica|
    #  aux = caracteristica.contador+1
    #  caracteristica.update_attribute(:contador, aux)
    #end
    
    respond_to do |format|
      if @imovel.save
        format.html { redirect_to administrativo_imovels_path, notice: 'Imóvel foi cadastrado com sucesso.' }
        format.json { render json: @imovel, status: :created, location: @imovel }
      else
        format.html { render action: "new" }
        format.json { render json: @imovel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /imovels/1
  # PUT /imovels/1.json
  def update
    @imovel = Imovel.find(params[:id])
    
    if !@imovel.vendido?
      @imovel.attributes = {:vendedor_id => '0'}
    end
    
    # arranjo temporario porque não tá cadastrando com nome quando é terreno
    if @imovel.tipo_imovel_id == TipoImovel::TERRENO
      @imovel.attributes = {:nome => "TERRENO LOCALIZADO: "+@imovel.localizacao}
    end
 
    respond_to do |format|
      if @imovel.update_attributes(params[:imovel])
        format.html { redirect_to administrativo_imovels_path, notice: 'Imóvel atualizado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @imovel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /imovels/1
  # DELETE /imovels/1.json
  # Método para remover um imovel, mas ele não remove realmente, apenas seta o imovel para inativo mantendo seu registro no banco.
  def destroy
    @imovel = Imovel.find(params[:id])
    @imovel.destroy
    
    
    #@imovel.attributes = {:ativo => false}

    respond_to do |format|
      format.html { redirect_to administrativo_imovels_url, :notice => 'O imóvel foi removido com sucesso.' }
      format.json { head :ok }
    end
  end
  
  
  #Métodos auxiliares para o controller de Imovel
  private
  
  # Método que vai popular todos os campos do imóvel a ser exibido para o usuário.
  def popular_imovel_aux
    
    @images = @imovel.images
    @transacao = TransacaoImovel.find(@imovel.transacao_imovel_id) if !@imovel.transacao_imovel_id.nil?
    @tipo_imovel = TipoImovel.find(@imovel.tipo_imovel_id) if !@imovel.tipo_imovel_id.nil?
    @vendedor = Corretor.find(@imovel.vendedor_id) if !@imovel.vendedor_id.nil?
    @cadastrado_por = Corretor.find(@imovel.cadastrador_id) if !@imovel.cadastrador_id.nil?
    
  end
  
  # Método delegate: preenche um objeto imovel com todas as informações completas dele. Inclusive associando a outras entidades como: transação,
  # responsável
  def popular_imovel(imovel_aux)
  
    if imovel_aux.nil?
      popular_imovel_aux
      return
    end
  
    # 0 transacao, 1 tipo_imovel, 2 responsavel
    lista_aux = []
    
    lista_aux[0] = TransacaoImovel.find(imovel_aux.transacao_imovel_id) if !imovel_aux.transacao_imovel_id.nil?
    lista_aux[1] = TipoImovel.find(imovel_aux.tipo_imovel_id) if !imovel_aux.tipo_imovel_id.nil?
    # lista_aux[2] = Corretor.find(@imovel.cadastrador_id) if !@imovel.cadastrador_id.nil?
    
    @hash_informacoes_imoveis[imovel_aux.id] = lista_aux
    
  end
  
  # Método que retorna o número que integra o 'Código de Referência' para o tipo de imóvel escolhido.
  def quantidade_imoveis
    count_tipo_imovel = Imovel.count_by_sql "SELECT COUNT(*) FROM imovels i WHERE i.tipo_imovel_id = "+@imovel.tipo_imovel_id.to_s
    count_tipo_imovel += 1
    puts count_tipo_imovel
    case count_tipo_imovel.to_s.length
    when 1
      @numero_codigo_referencia = "0000" + count_tipo_imovel.to_s
    when 2
      @numero_codigo_referencia = "000" + count_tipo_imovel.to_s
    when 3
      @numero_codigo_referencia = "00" + count_tipo_imovel.to_s
    when 4
      @numero_codigo_referencia = "0" + count_tipo_imovel.to_s
    else
      @numero_codigo_referencia = count_tipo_imovel.to_s
    end
  end
  
  # Método que verifica se o código de referência já existe no banco.
  # Esse método não vem sendo usado porque o número do código de referência está sendo construído a partir de todos os registros do campo.
  # Isso elimina a possibilidade de repetição de código, mas por enquanto o método não será deletado para que uma analise melhor seja feita no modelo.
  def verifica_unicidade_codigo_referencia?(codigo_referencia)
    existe_codigo = (Imovel.count_by_sql "SELECT COUNT(*) FROM imovels i WHERE i.codigo_referencia = '"+codigo_referencia+"'") == 0
    return existe_codigo
  end
  
end
