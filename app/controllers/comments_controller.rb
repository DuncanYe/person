class CommentsController < ApplicationController

  def create
    @item = Item.find(params[:item_id])
    @comment = @item.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save!
      flash[:notice] = "留言成功"
      redirect_to item_path(@item)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
