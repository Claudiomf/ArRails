class CaracteristicaImovelsController < ApplicationController
  def index
    @caracteristica_imovels = CaracteristicaImovel.all
  end
  
  # GET /imovels/new
  # GET /imovels/new.json
  def new
    @caracteristica_imovels = CaracteristicaImovel.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @imovel }
    end
  end
  
  # POST /imovels
  # POST /imovels.json
  def create
    @caracteristica_imovel = CaracteristicaImovel.new(params[:caracteristica_imovel])
    
    @caracteristica_imovel.attributes = {:contador => '0'}
    
    if has_role?(current_user, 'corretor')
      #@imovel_detalhe.attributes = {:ativo => false}
    end
    
    #@caracteristica_imovel.increment!(:contador)
    
    respond_to do |format|
      if @caracteristica_imovel.save
        format.html { redirect_to new_caracteristica_imovel_path, notice: 'Caracteristica foi cadastrada com sucesso.' }
        format.json { render json: new_caracteristica_imovel_path, status: :created, location: new_caracteristica_imovel_path }
      else
        format.html { render action: "new" }
        format.json { render json: @imovel_detalhe.errors, status: :unprocessable_entity }
      end
    end
  end
  
end
