class UsersController < ApplicationController

  def resume
    @user = User.find(params[:id])
    render file: "users/resume", :layout => false
  end

  def changepassword

  end

  def dochangepassword
    begin
      if params[:oldpassword].blank? || params[:password].blank? || params[:confirmpassword].blank?
        raise "Please complete the form."
      end
      if params[:password] != params[:confirmpassword]
        raise "Passwords should match"
      end

      user = User.where(:id => session[:user_id], :password_hash => Digest::SHA1.hexdigest( params[:oldpassword] )).first
        raise "Old password does not match" unless user

      user.password_hash = Digest::SHA1.hexdigest( params[:password] )

      raise unless user.save

      flash[:success] = "Password successfully changed"
    rescue
      flash[:error] = "Please check your input"
    end
      redirect_to "/changepassword"
  end

  def confirmuser
    begin
      if params[:password].blank? || params[:confirmpassword].blank? || params[:email].blank? || params[:code].blank?
        raise "Please complete the form. Please retry."
      end
      if params[:password] != params[:confirmpassword]
        raise "Passwords should match"
      end

      @tmpuser = Tmpuser.where(email: params[:email], code: params[:code]).first
      raise "User not found" if (nil == @tmpuser)
      user = User.create(:email => @tmpuser[:email], :firstname => @tmpuser[:firstname], :password_hash => Digest::SHA1.hexdigest( params[:password] ), :views => 0)
      raise "User couldn't be created. Contact the admin." if (nil == user)
      @tmpuser.destroy
      session[:user_id] = user.id
      flash[:success] = "Welcome :)"
      redirect_to "/users"
    rescue
      flash[:error] = "Something went wrong."
    end
  end

  def confirmemail
    begin
      @tmpuser = Tmpuser.where(email: params[:email], code: params[:code]).first
      if(@tmpuser == nil)
        raise
      end
    rescue
      flash[:error] = "The link is invalid. Please try signing up again."
      redirect_to "/welcome/index"
    end
  end

  def newtmp
    tmpuser = params[:tmpuser]
    if tmpuser[:email].blank? || tmpuser[:firstname].blank?
      flash[:error] = "All fields are mandatory"
    else

      user = User.where(email: tmpuser[:email]).first
      if(user)
        flash[:error] = "This exists a user with this email already"
      else
        newUser = Tmpuser.create(:email => tmpuser[:email], :firstname => tmpuser[:firstname], :code => Digest::SHA1.hexdigest( tmpuser[:email] + tmpuser[:firstname] + Time.now.to_s + rand(10000).to_s ) )
        flash[:success] = "Check your mailbox to know how to get started"
        AppMailer.welcome_email(newUser).deliver
      end
    end
    redirect_to "/welcome/index"
  end

  def authenticate
    user = User.where(email: params[:user][:email], password_hash: Digest::SHA1.hexdigest( params[:user][:password] ) ).first
    if(user)
      session[:user_id] = user.id
      redirect_to "/users"
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
    @user = Resume.find(session[:user_id])
    @experiences = @resume.experiences
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @experiences }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(session[:user_id])

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
    @user = User.find(session[:user_id])
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
    @user = User.find(session[:user_id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to "/profile", notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

end
