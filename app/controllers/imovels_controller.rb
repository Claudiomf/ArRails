class ImovelsController < ApplicationController
  load_and_authorize_resource
  # GET /imovels
  # GET /imovels.json
  def index
    #@imovels = Imovel.all
   
   #Traz apenas os imoveis ativos
   @imovels = Imovel.all.select { |i| i.ativo == true }

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
    popular_imovel
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @imovel }
    end
  end

  # GET /imovels/new
  # GET /imovels/new.json
  def new
    @imovel = Imovel.new
    @imovel.images.build
    
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
    
    @imovel.attributes = {:cadastrado_por_id => current_user.id}    
    @imovel.attributes = {:ativo => true}
    
    if has_role?(current_user, 'corretor')
      @imovel.attributes = {:ativo => false}
    end
    
    gerar_codigo_referencia
    
    respond_to do |format|
      if @imovel.save
        format.html { redirect_to @imovel, notice: 'Imovel foi cadastrado com sucesso.' }
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

 
    respond_to do |format|
      if @imovel.update_attributes(params[:imovel])
        format.html { redirect_to @imovel, notice: 'Imovel atualizado com sucesso.' }
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
    #@imovel.destroy
    
    
    @imovel.attributes = {:ativo => false}

    respond_to do |format|
      if @imovel.update_attributes(params[:imovel])
        format.html { redirect_to imovels_url, notice: 'Imovel removido com sucesso.'  }
        format.json { head :no_content }
      else
        format.html { render action: "destroy" }
        format.json { render json: @imovel.errors, status: :unprocessable_entity }
      end
    end
  end
  
  
  #Métodos auxiliares para o controller de Imovel
  private
  
  # Método que vai popular todos os campos do imóvel a ser exibido para o usuário.
  def popular_imovel
    
    @images = @imovel.images
    @transacao = ImovelTansacao.find(@imovel.imovel_transacao_id) if !@imovel.imovel_transacao_id.nil?
    @tipo_imovel = ImovelTipo.find(@imovel.imovel_tipo_id) if !@imovel.imovel_tipo_id.nil?
    @responsavel = User.find(@imovel.responsavel_id) if !@imovel.responsavel_id.nil?
    @vendedor = User.find(@imovel.vendedor_id) if !@imovel.vendedor_id.nil?
    @cadastrado_por = User.find(@imovel.cadastrado_por_id) if !@imovel.cadastrado_por_id.nil?
    
  end
  
  # Método que retorna o número que integra o 'Código de Referência' para o tipo de imóvel escolhido.
  def quantidade_imoveis
    count_tipo_imovel = Imovel.count_by_sql "SELECT COUNT(*) FROM imovels i WHERE i.imovel_tipo_id = "+@imovel.imovel_tipo_id.to_s
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
  
  
  # Método usado para gerar o código de referência de um imóvel baseado no tipo de imóvel escolhido no momento do cadastro.
  def gerar_codigo_referencia
    quantidade_imoveis  
    case @imovel.imovel_tipo_id
    when 1
      @imovel.attributes = {:cod_ref => "AP"+@numero_codigo_referencia}
    when 2
      @imovel.attributes = {:cod_ref => "CA"+@numero_codigo_referencia}
    when 3
      @imovel.attributes = {:cod_ref => "PC"+@numero_codigo_referencia}
    when 4
      @imovel.attributes = {:cod_ref => "TE"+@numero_codigo_referencia}
    else
      @imovel.attributes = {:cod_ref => "0000000"}
    end
  end
  
  # Método que verifica se o código de referência já existe no banco.
  # Esse método não vem sendo usado porque o número do código de referência está sendo construído a partir de todos os registros do campo.
  # Isso elimina a possibilidade de repetição de código, mas por enquanto o método não será deletado para que uma analise melhor seja feita no modelo.
  def verifica_unicidade_codigo_referencia?(codigo_referencia)
    existe_codigo = (Imovel.count_by_sql "SELECT COUNT(*) FROM imovels i WHERE i.cod_ref = '"+codigo_referencia+"'") == 0
    return existe_codigo
  end
  
end
