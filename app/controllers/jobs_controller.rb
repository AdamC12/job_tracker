class JobsController < ApplicationController
  before_action :set_job, only: [:update, :edit, :destroy]
  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
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
        raise error
      end
  end

  private

  def job_params
    params.require(:job).permit(:title, :company, :location, :link)
  end

  def set_job
    @job = Job.find(params[:id])
  end

end