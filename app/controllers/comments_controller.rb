class CommentsController < ApplicationController
def index
  @comment_topics = current_user.comment_topics
end

def new
  @comment = Comment.new
end

def create
  @comment = current_user.comments.new (comment_params)
  @comment.user_id = current_user.id


if @comment.save
  redirect_to topics_path, success: '投稿に成功しました'
else
  redirect_to topics_path, danger: '投稿に失敗しました'
  end
end

private
def comment_params
  params.require(:comment).permit(:topic_id, :content)
  end
end
