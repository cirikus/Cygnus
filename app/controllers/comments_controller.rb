class CommentsController < ApplicationController

	def create
    @task = Task.find params[:task_id]
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
    @task = Task.find params[:task_id]
    @comment = @task.comments.find(params[:id])
    if @comment.destroy
      flash[:notice] = "Successfully deleted comment!"
      redirect_to task_path(@task)
    else
      flash[:alert] = "Error updating comment!"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def find_comment
    @comment = Comment.find(params[:id])
  end 
end
