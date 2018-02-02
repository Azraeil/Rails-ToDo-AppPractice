class TasksController < ApplicationController
  def index
    today = Time.now.strftime("%Y-%m-%d")
    # puts "Today is #{today} !!!!"
    @undone_tasks = Task.where(done: false).where("deadline>?", Date.yesterday).order(:deadline)

    @done_tasks = Task.where(done: true)

    @expired_tasks = Task.where(done: false).where("deadline<?", Date.today).order(:deadline)
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to(tasks_path, notice: "建立待辦事項成功！")
    else
      render :new
    end
  end

  def done
    @task = Task.find(params[:id])
    @task.update_attribute(:done, true)
    redirect_to tasks_path
  end

  def show
    @task = Task.find_by(id: params[:id])
  end

  def edit
    @task = Task.find_by(id: params[:id])
  end

  def update
    @task = Task.find_by(id: params[:id])
    if @task.update_attributes(task_params)
      redirect_to task_path(@task.id)
    else
      render :edit
    end
  end

  def destroy
    @task = Task.find_by(id: params[:id])
    @task.destroy

    redirect_to tasks_path
  end

  private
  def task_params
    params.require(:task).permit(:name, :deadline, :description, :done)
  end
end
