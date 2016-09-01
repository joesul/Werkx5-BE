class JobsController < ApplicationController

  def index
    jobs = Job.all
    render json: jobs
  end

  def list
    jobs = Job.where(username: params[:username])
    render json: jobs
  end

  def work
    puts "params", params
    jobs = Job.where(worker: params[:username])
    render json: jobs
  end

  def show
    job = Job.where(zip: params[:zip])
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

  def take
    puts "take params: #{params[:username]}, jobId: #{params[:id]}"
    found_job = Job.where(id: params[:id])
    updated = found_job.update(worker: params[:username])
    if updated
      render json: updated
    else
      render json: {'error': updated.errors}
    end
  end

  def forupdate
    found_job = Job.where(id: params[:id])
    render json: found_job
  end

  def status
    found_job = Job.where(id: params[:id])
    updated = found_job.update(job_status: "Completed")
    if updated
      render json: updated
    else
      render json: {'error': updated.errors}
    end
  end

  def edit
    found_job = Job.where(id: params[:id])
    updated = found_job.update(job_name: params[:job_name], offer: params[:offer], zip: params[:zip], description: params[:description])
    render json: found_job
  end

  def destroy
    found_job = Job.where(id: params[:id])
    Job.destroy(found_job)
    updated = Job.where(username: params[:username])
    render json: {'job': updated}
 end

end
