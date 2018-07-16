class JobsController < ApplicationController
  def index
      @jobs = @current_user.projects.first.jobs
  end

  def show
    @job = Job.find params[:id]
   end

   def stop
     job = Job.find params[:id]
     job.update :end_time => Time.current
     redirect_to job.project
   end


  def new
      @job = Job.new
      @job.start_time = Time.current
  end

  def create
    job = Job.new
   job.description = params[:job][:description]
   job.start_time = params[:job][:start_time]
   job.end_time = params[:job][:end_time]
   job.project_id =  params[:job][:project_id]

   job.save

   redirect_to job_path(job) #project_path(job.project)
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
