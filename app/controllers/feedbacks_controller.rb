class FeedbacksController < ApplicationController
  # GET /feedbacks
  # GET /feedbacks.json
  def index
  end

  # GET /feedbacks/new
  # GET /feedbacks/new.json
  def new
    @feedback = Feedback.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # POST /feedbacks
  # POST /feedbacks.json
  def create
    @feedback = Feedback.new(params[:feedback])
    if @feedback.save
      flash[:success] = "Feedback was successfully submitted. Thank you. :)"
      AppMailer.feedback(@feedback).deliver
      redirect_to "/"
    else
      flash[:error] = "Please try again."
      redirect_to "/feedback"
    end
  end

end
