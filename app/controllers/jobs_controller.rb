class JobsController < ApplicationController
  before_action :set_job, only: [:update, :edit, :destroy]

  def index
    @jobs = Job.all
    @applied_jobs = Job.where(status: 'Applied')
    @interested_jobs = Job.where(status: 'Interested')
    @interviewed_jobs = Job.where(status: 'Interviewed')
    @offered_jobs = Job.where(status: 'Offered')
    @rejected_jobs = Job.where(status: 'Rejected')
    @no_status_jobs = Job.where(status: nil)
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