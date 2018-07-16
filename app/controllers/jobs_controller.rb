class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find params[:id]
   end


  def new
      @job = Job.new
  end

  def create
    job = Job.new
   job.description = params[:job][:description]
   job.start_time = params[:job][:start_time]
   job.end_time = params[:job][:end_time]
   job.project_id =  params[:job][:project_id]
   
   job.save

   redirect_to jobs_path
 end

  def edit
      @job = Job.find params[:id]
  end

  def destroy
      job = Job.find params[:id]
      job.destroy
      redirect_to jobs_path
    end


end
