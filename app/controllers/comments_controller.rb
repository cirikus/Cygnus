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

  	def comment_params
    	params.require(:comment).permit(:content)
  	end

end
