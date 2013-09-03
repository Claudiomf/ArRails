class Administrativo::UsersController < Administrativo::CorretorController
  #load_and_authorize_resource
  # GET /users
  # GET /users.json
  def index
    @search = User.search(params[:q])
    @users = @search.result
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    
    #@endereco = Endereco.find(:first,:conditions => { :corretor_id => @user.corretor.id} )
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new
    @user.build_corretor
    @user.corretor.build_endereco
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    #@user.build_corretor
    #@user.corretor.build_endereco
    #@corretor = Corretor.find(@user.corretor.id)
    #@endereco = Endereco.find(:first,:conditions => { :corretor_id => @user.corretor.id} )
    #@endereco = Endereco.new if @endereco.nil?
    
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    
    respond_to do |format|
      if @user.save
        flash[:notice] = flash[:notice].to_a.concat @user.errors.full_messages
        format.html { redirect_to administrativo_users_path, :notice => 'O corretor foi cadastrado com sucesso.' }
        format.json { render :json => @user, :status => :created, :location => @user }
      else
        # Tirado pois as mensagens estão sendo exibidas usando o padrao vistO NAS PAGINAS HTML.ERB
        # flash[:notice] = flash[:notice].to_a.concat @user.errors.full_messages
        format.html { render :action => "new"}
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])
    if params[:user][:password].blank?
        params[:user].delete(:password)
        params[:user].delete(:password_confirmation)
    end
    
    @user.corretor
    
    #@corretor = @user.corretor
    #@corretor.update_attributes(params[:corretor])
    
    #@endereco = Endereco.find(:first,:conditions => { :corretor_id => @user.corretor.id} )
    #@endereco.update_attributes(params[:endereco])
 
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to administrativo_users_path, :notice => 'O corretor foi atualizado com sucesso.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to corretor_corretors_url, :notice => 'O corretor foi removido com sucesso.' }
      format.json { head :ok }
    end
  end
end
