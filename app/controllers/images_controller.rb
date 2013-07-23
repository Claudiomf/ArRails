class ImagesController < ApplicationController
  # GET /images/new
  # GET /images/new.json
  def new
    @image = Image.new(:imovel_id => params[:imovel_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @image }
    end
  end

  # GET /images/1/edit
  def edit
    @image = Image.find(params[:id])
  end

  # POST /images
  # POST /images.json
  def create
    @image = Image.new(params[:image])
    
    if @image.save
      flash[:notice] = "Successfully created image."
      redirect_to @image.imovel
    else
      render :action => 'new'
    end
  end

  # PUT /images/1
  # PUT /images/1.json
  def update
    @image = Image.find(params[:id])
    
    if @image.update_attributes(params[:image])
      flash[:notice] = "Successfully updated image."
      redirect_to @image.imovel
    else
      render :action => 'edit'
    end
  end

  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    @image = Image.find(params[:id])
    
    @image.destroy
    flash[:notice] = "Successfully destroyed image."
    redirect_to @image.imovel
  end
end