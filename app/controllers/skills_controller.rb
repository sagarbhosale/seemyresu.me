class SkillsController < ApplicationController
  # GET /skills
  # GET /skills.json
  def index
    @user = User.find(session[:user_id])
    @skills = @user.skills
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @skills }
    end
  end

  # GET /skills/new
  # GET /skills/new.json
  def new
    @skill = Skill.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @skill }
    end
  end

  # GET /skills/edit
  def edit
    @user = User.find(session[:user_id])
    @skills = @user.skills
    @skill = Skill.new
  end

  # POST /skills
  # POST /skills.json
  def create
    params[:skill][:user_id] = session[:user_id]
    @skill = Skill.new(params[:skill])

    respond_to do |format|
      if @skill.save
        format.html { redirect_to "/skills", notice: 'Skill was successfully created.' }
        format.json { render json: @skill, status: :created, location: @skill }
      else
        # TODO show error
        format.html { render action: "new" }
        format.json { render json: @skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /skills/1
  # PUT /skills/1.json
  def update
    @skill = Skill.find(params[:id])

    respond_to do |format|
      if @skill.update_attributes(params[:skill])
        format.html { redirect_to @skill, notice: 'Skill was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /skills/1
  # DELETE /skills/1.json
  def destroy
    @skill = Skill.find(params[:id])
    @skill.destroy

    respond_to do |format|
      format.html { redirect_to skills_url }
      format.json { head :no_content }
    end
  end
end
