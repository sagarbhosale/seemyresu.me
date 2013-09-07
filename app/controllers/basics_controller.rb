class BasicsController < ApplicationController
  # GET /basics
  # GET /basics.json
  def index
    @basic = Basic.where(id: session[:user_id]).first
    render "Basics/show"
  end

  # GET /basics/new
  # GET /basics/new.json
  def new
    @basic = Basic.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @basic }
    end
  end

  # GET /basics/edit
  def edit
    @basic = Basic.where(id: session[:user_id]).first
  end

  # POST /basics
  # POST /basics.json
  def create
    return
    @basic = Basic.new(params[:basic])

    respond_to do |format|
      if @basic.save
        format.html { redirect_to @basic, notice: 'Basic was successfully created.' }
        format.json { render json: @basic, status: :created, location: @basic }
      else
        format.html { render action: "new" }
        format.json { render json: @basic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /basics
  # PUT /basics.json
  def update
    @basic = Basic.where(id: session[:user_id]).first

    respond_to do |format|
      if @basic.update_attributes(params[:basic])
        format.html { redirect_to "/basics", notice: 'Basic was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @basic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /basics
  # DELETE /basics.json
  def destroy
    @basic = Basic.find(params[:id])
    @basic.destroy

    respond_to do |format|
      format.html { redirect_to basics_url }
      format.json { head :no_content }
    end
  end
end
