class CommentsController < ApplicationController
    # コメントを保存、投稿するためのアクションです。
  def create
    # Blogをパラメータの値から探し出し,Blogに紐づくcommentsとしてbuildします。
    @comment = current_user.comments.build(comment_params)
    @blog = @comment.blog
    # クライアント要求に応じてフォーマットを変更
    respond_to do |format|
      if @comment.save
        format.html { redirect_to blog_path(@blog)}
          flash[:notice] = "コメントを投稿しました。"
        # JS形式でレスポンスを返します。
        format.js { render :index }
      else
        format.html { render :new }
      end
    end
  end

#追加開始
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
        format.html {redirect_to blogs_path(@blog)}
          flash[:notice] = "コメントを削除しました！"
        format.js { render :index }
    end
  end
#追加終了
def edit
end

#編集追加
def update
  @comment = Comment.find(params[:id])
  if @comment.update
     redirect_to blogs_path(@blog), notice: "コメントを編集しました！"
  else
    render 'edit'
  end
end


#def update
  #  @comment = Comment.find(params[:id])

  #  respond_to do |format|
  #    if @comment.update(comment_params)
  #      format.html {redirect_to blogs_path(@blog)}
  #      flash[:notice] = "ブログを編集しました！"
  #      format.js { render :index }
  #    else
  #      format.html { render :edit}
  #    end
  #  end
#end
#編集終了

  private
    # ストロングパラメーター
    def comment_params
      params.require(:comment).permit(:blog_id, :content)
    end

end
