class JobsController < ApplicationController
  before_action :set_job, only: [:update, :edit, :destroy]
  before_action :authenticate_user!, only: [:edit]

  def index
    @jobs = current_user.jobs
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
    unless @job.user_id == current_user.id
       redirect_to root_path
    end
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

end