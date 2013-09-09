class UsersController < ApplicationController

  def confirmemail
    # if params[:email].empty? || params[:code].empty?
    #   flash[:error] = "The link is invalid. Please try signing up again."
    # else
    #   tmpuser = Tmpuser.where(email: params[:email], code: params[:code]).first
    #   if(tmpuser)
    #     user = User.create(:email => tmpuser[:email], :firstname => tmpuser[:firstname], :lastname => "", :password_hash => Digest::SHA1.hexdigest( Digest::SHA1.hexdigest( tmpuser[:code] )[0,6] ) )
    #     user.save
    #     tmpuser.destroy
    #     flash[:success] = "Email confirmed. You can log in now."
    #   else
    #     flash[:error] = "The link is invalid. Please try signing up again."
    #   end
    # end
    redirect_to "/welcome/index"
  end

  def newtmp
    if params[:email].empty? || params[:firstname].empty?
      flash[:error] = "All fields are mandatory"
    else

      user = User.where(email: params[:email]).first
      if(user)
        flash[:error] = "This exists a user with this email already"
      else
        newUser = Tmpuser.create(:email => params[:email], :firstname => params[:firstname], :code => Digest::SHA1.hexdigest( params[:email] + params[:firstname] + Time.now.to_s + rand(10000).to_s ) )
        flash[:success] = "Check your mailbox to know how to get started"
      end
    end
    redirect_to "/welcome/index"
  end

  def authenticate
    user = User.where(email: params[:email], password_hash: Digest::SHA1.hexdigest( params[:password] ) ).first
    if(user)
      session[:user_id] = user.id
      redirect_to "/basics"
    else
      redirect_to "/welcome/index", :flash => { :error => "Invalid username or password" }
    end
  end

  def logout
      session[:user_id] = nil
      redirect_to "/welcome/index"
  end 

  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

end
