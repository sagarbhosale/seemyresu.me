class AchievementsController < ApplicationController
  before_filter :logged_in

  def logged_in
    if session[:user_id] == nil
      redirect_to "/", notice: "Please login"
    end
  end

  # GET /achievements
  # GET /achievements.json
  def index
    @user = User.find(session[:user_id])
    @achievements = @user.achievements
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @achievements }
    end
  end

  # GET /achievements/new
  # GET /achievements/new.json
  def new
    @achievement = Achievement.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @achievement }
    end
  end

  # GET /achievements/edit
  def edit
    @user = User.find(session[:user_id])
    @achievements = @user.achievements.sort_by { |ele| ele.year }.reverse
    @achievement = Achievement.new
  end

  # POST /achievements
  # POST /achievements.json
  def create
    params[:achievement][:user_id] = session[:user_id]
    @achievement = Achievement.new(params[:achievement])

    respond_to do |format|
      if @achievement.save
        format.html { redirect_to "/achievements", notice: 'Achievement was successfully created.' }
        format.json { render json: @achievement, status: :created, location: @achievement }
      else
        # TODO show error
        format.html { render action: "new" }
        format.json { render json: @achievement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /achievements/1
  # PUT /achievements/1.json
  def update
    @achievement = Achievement.find(params[:id])

    respond_to do |format|
      if @achievement.update_attributes(params[:achievement])
        format.html { redirect_to @achievement, notice: 'Achievement was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @achievement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /achievements/1
  # DELETE /achievements/1.json
  def destroy
    @achievement = Achievement.find(params[:id])
    @achievement.destroy

    respond_to do |format|
      format.html { redirect_to achievements_url }
      format.json { head :no_content }
    end
  end
end
