class ImovelDetalhesController < ApplicationController
  def index
    @imovel_detalhes = ImovelDetalhe.all
    
    
  end
  
  # GET /imovels/new
  # GET /imovels/new.json
  def new
    @imovel_detalhes = ImovelDetalhe.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @imovel }
    end
  end
  
  # POST /imovels
  # POST /imovels.json
  def create
    @imovel_detalhe = ImovelDetalhe.new(params[:imovel_detalhe])
    
    
    
    if has_role?(current_user, 'corretor')
      @imovel_detalhe.attributes = {:ativo => false}
    end
    
    respond_to do |format|
      if @imovel_detalhe.save
        format.html { redirect_to new_imovel_detalhe_path, notice: 'Detalhe foi cadastrado com sucesso.' }
        format.json { render json: new_imovel_detalhe_path, status: :created, location: new_imovel_detalhe_path }
      else
        format.html { render action: "new" }
        format.json { render json: @imovel_detalhe.errors, status: :unprocessable_entity }
      end
    end
  end
  
end
