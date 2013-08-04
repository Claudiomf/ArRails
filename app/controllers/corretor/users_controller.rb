class Corretor::UsersController < Corretor::CorretorController
  load_and_authorize_resource
  
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
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new
    @corretor = Corretor.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    #@user.attributes = params[:user]
    #@user.role_ids = params[:user][:role_ids] if params[:user]
    @user = User.new(params[:user])
    @corretor = Corretor.new(params[:corretor])
    
    if @corretor.save
      @user.corretor_id = @corretor.id      
    end
    
    respond_to do |format|
      if @user.save
        flash[:notice] = flash[:notice].to_a.concat @user.errors.full_messages
        flash[:notice] = flash[:notice].to_a.concat @corretor.errors.full_messages
        format.html { redirect_to corretor_users_path, :notice => 'O corretor foi cadastrado com sucesso.' }
        format.json { render :json => @user, :status => :created, :location => @user }
      else
        # Tirado pois as mensagens estão sendo exibidas usando o padrao vistO NAS PAGINAS HTML.ERB
        # flash[:notice] = flash[:notice].to_a.concat @user.errors.full_messages
        format.html { render :action => "new"}
        format.json { render :json => @user.errors + @corretor.errors, :status => :unprocessable_entity }
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
 
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to corretor_users_path, :notice => 'O corretor foi atualizado com sucesso.' }
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
      format.html { redirect_to corretor_users_url, :notice => 'O corretor foi removido com sucesso.' }
      format.json { head :ok }
    end
  end
end
