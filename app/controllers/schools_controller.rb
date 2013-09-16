class SchoolsController < ApplicationController
  before_filter :logged_in

  def logged_in
    if session[:user_id] == nil
      redirect_to "/", notice: "Please login"
    end
  end

  # GET /schools
  # GET /schools.json
  def index
    @user = User.find(session[:user_id])
    @schools = @user.schools
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @schools }
    end
  end

  # GET /schools/new
  # GET /schools/new.json
  def new
    @school = School.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @school }
    end
  end

  # GET /schools/edit
  def edit
    @user = User.find(session[:user_id])
    @schools = @user.schools.sort_by { |ele| ele.to }.reverse 
    @school = School.new
  end

  # # POST /schools
  # # POST /schools.json
  # def create
  #   params[:school][:user_id] = session[:user_id]
  #   @school = School.new(params[:school])

  #   respond_to do |format|
  #     if @school.save
  #       format.html { redirect_to "/schools", notice: 'School was successfully created.' }
  #       format.json { render json: @school, status: :created, location: @school }
  #     else
  #       # TODO show error
  #       format.html { render action: "new" }
  #       format.json { render json: @school.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PUT /schools/1
  # PUT /schools/1.json
  def update
    @school = School.find(params[:id])

    respond_to do |format|
      if @school.update_attributes(params[:school])
        format.html { redirect_to @school, notice: 'School was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schools/1
  # DELETE /schools/1.json
  def destroy
    @school = School.find(params[:id])
    @school.destroy

    respond_to do |format|
      format.html { redirect_to schools_url }
      format.json { head :no_content }
    end
  end
end
