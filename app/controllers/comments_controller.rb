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

  def destroy
    @item = Item.find(params[:item_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "留言已經刪除"
    redirect_to item_path(@item)
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
