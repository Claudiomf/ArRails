# encoding: utf-8
class Administrativo::CaracteristicaImovelsController < Administrativo::CorretorController
  def index
    #@caracteristica_imovels = CaracteristicaImovel.all
    
    @caracteristica_imovels = CaracteristicaImovel.order(:descricao)
    
  end
  
  # GET /imovels/1/edit
  def edit
    @caracteristica_imovel = CaracteristicaImovel.find(params[:id])
  end
  
  # GET /imovels/new
  # GET /imovels/new.json
  def new
    @caracteristica_imovel = CaracteristicaImovel.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @caracteristica_imovel }
    end
  end
  
  # POST /imovels
  # POST /imovels.json
  def create
    @caracteristica_imovel = CaracteristicaImovel.new(params[:caracteristica_imovel])
    
    descricao_aux = @caracteristica_imovel.descricao.downcase 
    descricao_aux = descricao_aux.titleize
    
    @caracteristica_imovel.attributes = {:contador => '0'}
    @caracteristica_imovel.attributes = {:descricao => descricao_aux}
    
    if has_role?(current_user, 'corretor')
      #@imovel_detalhe.attributes = {:ativo => false}
    end
    
    #@caracteristica_imovel.increment!(:contador)
    
    respond_to do |format|
      if @caracteristica_imovel.save
        # Comentado o trecho que direcionava novamente para a tela de cadastro e não a listagem.
        #format.html { redirect_to new_administrativo_caracteristica_imovel_path, notice: 'Característica '+@caracteristica_imovel.descricao+' foi cadastrada com sucesso.' }
        #format.json { render json: @caracteristica_imovel, status: :created, location: new_administrativo_caracteristica_imovel_path }
        format.html { redirect_to administrativo_caracteristica_imovels_path, notice: 'Característica '+@caracteristica_imovel.descricao+' foi cadastrado com sucesso.' }
        format.json { render json: @caracteristica_imovel, status: :created, location: @caracteristica_imovel }
      else
        format.html { render action: "new" }
        format.json { render json: @caracteristica_imovel.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # DELETE /imovels/1
  # DELETE /imovels/1.json
  # Método para remover um imovel, mas ele não remove realmente, apenas seta o imovel para inativo mantendo seu registro no banco.
  def destroy
    @caracteristica_imovel = CaracteristicaImovel.find(params[:id])
    
    @caracteristica_imovel.destroy

    respond_to do |format|
        format.html { redirect_to caracteristica_imovels_url, notice: 'Caracteristica removida com sucesso.'  }
        format.json { head :no_content }
    end
  end
  
end
