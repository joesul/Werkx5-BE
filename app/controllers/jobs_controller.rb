class JobsController < ApplicationController

  def index
    jobs = Job.all
    render json: jobs
  end

  def showzip
    job = Job.where(username: params[:username])
    render json: job
  end

  def showuid
    puts "params", params
    job = Job.where(username: params[:username])
    render json: job
  end

  def create
    puts "params!!: #{params[:username]} #{params[:job_name]}, #{params[:zip]}, #{params[:offer]}, #{params[:description]}"
    new_job = Job.new(username: params[:username], job_name: params[:job_name], zip: params[:zip], offer: params[:offer], description: params[:description])

    if new_job.save
      render json: new_job
    else
      render json: {'error': new_job.errors}
    end
  end

end
