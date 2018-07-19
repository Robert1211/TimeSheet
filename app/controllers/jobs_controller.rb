class JobsController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:update]
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

   # def pause
   #   job = Job.find params[:id]
   #   job.update :start_time => Time.current
   #   job.save
   #   redirect_to job.project
   # end
   #
   # def endpause
   #   job = Job.find params[:id]
   #   job.update :end_time => Time.current
   #   # redirect_to job.project
   # end

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

  def update
    @job = Job.find params[:id]
    if params[:duration].present?
      # AJAX version
      duration = Time.parse(params[:duration]).seconds_since_midnight
      @job.update :duration => duration
      render :json => @job # This is just to silence errors in the console
    else
      # Finish job (not AJAX)
      duration = Time.parse(params[:job][:duration]).seconds_since_midnight
      @job.update :duration => duration, :end_time => Time.now
      redirect_to projects_path
    end
  end

  def destroy
      job = Job.find params[:id]
      job.destroy
      redirect_to projects_path
  end


end
