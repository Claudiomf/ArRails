# encoding: utf-8
class Administrativo::CorretorsController < Administrativo::CorretorController
  load_and_authorize_resource
  # GET /users
  # GET /users.json
  def index
    @search = Corretor.search(params[:q])
    @corretors = @search.result
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @corretors }
    end
  end
  
  # GET /users/1
  # GET /users/1.json
  def show
    @corretor = Corretor.find(params[:id])
    
    #@endereco = Endereco.find(:first,:conditions => { :corretor_id => @user.corretor.id} )
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @corretor }
    end
  end
  
  # GET /users/new
  # GET /users/new.json
  def new
    @corretor = Corretor.new
    @corretor.build_user
    @corretor.build_endereco
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @corretor }
    end
  end
  
  # GET /users/1/edit
  def edit
    @corretor = Corretor.find(params[:id])
    #@user.build_corretor
    #@user.corretor.build_endereco
    #@corretor = Corretor.find(@user.corretor.id)
    #@endereco = Endereco.find(:first,:conditions => { :corretor_id => @user.corretor.id} )
    #@endereco = Endereco.new if @endereco.nil?
    
  end
  
  # POST /users
  # POST /users.json
  def create
    @corretor = Corretor.new(params[:corretor])
    
    respond_to do |format|
      if @corretor.save
        flash[:notice] = flash[:notice].to_a.concat @corretor.errors.full_messages
        format.html { redirect_to administrativo_corretors_path, :notice => 'O corretor foi cadastrado com sucesso.' }
        format.json { render :json => @corretor, :status => :created, :location => @corretor }
      else
        # Tirado pois as mensagens estão sendo exibidas usando o padrao vistO NAS PAGINAS HTML.ERB
        # flash[:notice] = flash[:notice].to_a.concat @user.errors.full_messages
        format.html { render :action => "new"}
        format.json { render :json => @corretor.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # PUT /users/1
  # PUT /users/1.json
  def update
    @corretor = Corretor.find(params[:id])
    @corretor.user.update_with_password(params[:corretor][:user_attributes])
    
    respond_to do |format|
      if @corretor.update_attributes(params[:corretor])
        format.html { redirect_to administrativo_corretors_path, :notice => 'O corretor foi atualizado com sucesso.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @corretor.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @corretor = Corretor.find(params[:id])
    @corretor.destroy

    respond_to do |format|
      format.html { redirect_to administrativo_corretors_url, :notice => 'O corretor foi removido com sucesso.' }
      format.json { head :ok }
    end
  end
  
end
