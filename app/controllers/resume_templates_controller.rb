class ResumeTemplatesController < ApplicationController
  before_filter :logged_in

  def logged_in
    if session[:user_id] == nil
      redirect_to "/", notice: "Please login"
    end
  end

  # GET /resume_templates
  # GET /resume_templates.json
  def index
    @resume_templates = ResumeTemplate.all
    @selected = ResumeTemplate.find(User.find(session[:user_id]).resume_template).name

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @resume_templates }
    end
  end

  # GET /resume_templates/new
  # GET /resume_templates/new.json
  def new
    @resume_template = ResumeTemplate.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @resume_template }
    end
  end

  # GET /resume_templates/1/edit
  def edit
    @resume_template = ResumeTemplate.find(params[:id])
  end

  # POST /resume_templates
  # POST /resume_templates.json
  def create
    @resume_template = ResumeTemplate.new(params[:resume_template])

    respond_to do |format|
      if @resume_template.save
        format.html { redirect_to @resume_template, notice: 'Resume template was successfully created.' }
        format.json { render json: @resume_template, status: :created, location: @resume_template }
      else
        format.html { render action: "new" }
        format.json { render json: @resume_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /resume_templates/1
  # PUT /resume_templates/1.json
  def update
    @resume_template = ResumeTemplate.find(params[:id])

    respond_to do |format|
      if @resume_template.update_attributes(params[:resume_template])
        format.html { redirect_to @resume_template, notice: 'Resume template was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @resume_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resume_templates/1
  # DELETE /resume_templates/1.json
  def destroy
    @resume_template = ResumeTemplate.find(params[:id])
    @resume_template.destroy

    respond_to do |format|
      format.html { redirect_to resume_templates_url }
      format.json { head :no_content }
    end
  end
end
