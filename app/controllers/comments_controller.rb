class CommentsController < ApplicationController

  def create
    @item = Item.find(params[:item_id])
    @comment = @item.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      flash[:notice] = "留言成功"
    else
      flash[:alert] = "留言不可空白"
    end
      # redirect_to item_path(@item)
      redirect_to request.referrer, alert: @comment.errors.full_messages.to_sentence
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
