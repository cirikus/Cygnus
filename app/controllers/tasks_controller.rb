class TasksController < ApplicationController
   
   before_action :authenticate_admin!, except: [:index, :show] 
   before_action :find_task, only: [:edit, :update, :show, :delete]

  # Index action to render all tasks
  def index
    @tasks = Task.all
    respond_to do |format|
      format.html
      format.csv { send_data @tasks.to_csv }
      format.xls # { send_data @tasks.to_csv(col_sep: "\t") }
    end
  end

  # New action for creating task
  def new
    @task = Task.new
  end

  # Create action saves the task into database
  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:notice] = "Successfully created task!"
      redirect_to task_path(@task)
    else
      flash[:alert] = "Error creating new task!"
      render :new
    end
  end

  # Edit action retrives the task and renders the edit page
  def edit
  end

  # Update action updates the task with the new information
  def update
    if @task.update_attributes(task_params)
      flash[:notice] = "Successfully updated task!"
      redirect_to task_path(@task)
    else
      flash[:alert] = "Error updating task!"
      render :edit
    end
  end

  # The show action renders the individual task after retrieving the the id
  def show
  end

  # The destroy action removes the task permanently from the database
  def destroy
    @task = find_task
    if @task.destroy
      flash[:notice] = "Successfully deleted task!"
      redirect_to tasks_path
    else
      flash[:alert] = "Error updating task!"
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :body, :recorded_at)
  end

  def find_task
    @task = Task.find(params[:id])
  end 
    
end