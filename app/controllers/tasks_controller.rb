class TasksController < ApplicationController
  # skip_before_action :verify_authenticity_token
  before_action :find_task, only: %i[show edit update destroy]

  def index
    @tasks = Task.all.order(:id)
  end

  def create
    @task = Task.new(tasks_params)
    if @task.save
      redirect_to @task
    else
      render new_task_path
    end
  end

  def new; end

  def show; end

  def edit; end

  def update
    if @task.update(tasks_params)
      redirect_to @task
    else
      render edit_task_path
    end
  end

  def destroy
    if @task.destroy.destroyed?
      redirect_to tasks_path
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  private

  def tasks_params
    params.require(:task).permit(:text)
  end

  def find_task
    @task = Task.where(id: params[:id]).first
    render_404 unless @task
  end
end
