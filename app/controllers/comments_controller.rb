class CommentsController < ApplicationController

  before_action :find_task, only: [:create, :destroy, :last_comment]

	def create
    @comment = @task.comments.new(comment_params)
    if @comment.save
    	flash[:notice] = "Successfully created comment!"
    else
			flash[:alert] = "Error creating new comment!"
    end
    redirect_to task_path(@task)     
  end

# The destroy action removes the task permanently from the database
  def destroy
    @comment = @task.comments.find(params[:id])
    if @comment.destroy
      flash[:notice] = "Successfully deleted comment!"
      redirect_to task_path(@task)
    else
      flash[:alert] = "Error updating comment!"
    end
  end

  # Search last comment of one task
  def last_comment
      @comment = @task.comments.last
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def find_task
    @task = Task.find params[:task_id]
  end 
end
