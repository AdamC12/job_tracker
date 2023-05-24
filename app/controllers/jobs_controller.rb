class JobsController < ApplicationController
  before_action :set_job, only: [:update, :edit, :destroy]
  before_action :authenticate_user!, only: [:edit]
  before_action :confirm_job_owner_is_current_user, only: [:edit, :destroy]

  def index
    if user_signed_in?
      @jobs = current_user.jobs
    else
    end
  end

  def new
    @job = Job.new
  end

  def create
    @job = current_user.jobs.new(job_params)
    if @job.save
      redirect_to action: :index
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @job.update(job_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @job.destroy
      redirect_to root_path
    else
      raise "job could not be destroyed"
    end
  end

  private

  def job_params
    params.require(:job).permit(:title, :company, :location, :link, :status)
  end

  def set_job
    @job = Job.find(params[:id])
  end

  def confirm_job_owner_is_current_user
    redirect_to root_path unless @job.user_id == current_user.id
  end

end