class TasksController < ApplicationController
  def index
    today = Time.now.strftime("%m-%d-%Y")

    @undone_tasks = Task.where.(done: false).where("deadline>?", Date.yesterday).order(:deadline)

    @done_tasks = Task.where(done: true)

    @expired_tasks = Task.where(done: false).where("deadline<?", Date.today).order(:deadline)
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @user.save
      redirect_to(users_path, notice: "建立待辦事項成功！")
    else
      render :new
    end
  end

  def show
    @task = Task.find_by(id:params[:id])
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

  def task_params
    params.require(:task).permit(:name, :deadline, :description)
  end
end
