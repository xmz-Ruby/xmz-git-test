class CommentsController < ApplicationController
  http_basic_authenticate_with name: "xmz", password: "123", only: :destroy

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    # puts @article.inspect
    # <Article id: 3, title: "This is a  title", text: "Hello Rails!", created_at: "2019-10-23 08:03:06", updated_at: "2019-10-24 06:46:44">
    # puts @article.comments.inspect
    #<ActiveRecord::Associations::CollectionProxy [#<Comment id: 10, commenter: "Maisiteng", body: "澶ц嫃鎵�", article_id: 3, created_at: "2019-10-30 03:13:23", updated_at: "2019-10-30 03:13:23">, #<Comment id: 11, commenter: "Maisiteng", body: "鐨勬拻鏃�", article_id: 3, created_at: "2019-10-30 03:15:21", updated_at: "2019-10-30 03:15:21">, #<Comment id: 12, commenter: "Maisiteng", body: "鍙戠殑", article_id: 3, created_at: "2019-10-30 03:15:58", updated_at: "2019-10-30 03:15:58">, #<Comment id: 13, commenter: "Maisiteng", body: "鍙嶅娉曞晩", article_id: 3, created_at: "2019-10-30 03:17:54", updated_at: "2019-10-30 03:17:54">]>
    # puts params.inspect
    # <ActionController::Parameters {"utf8"=>"鉁�", "authenticity_token"=>"DsponlqlTrzTKZ6VwAW6MR6dveFxpIVXDTO4PTq0V1Lk5PX+4pe33CIC2djm9Lh+S8VyabRkVv+raopst4Teyg==", "comment"=><ActionController::Parameters {"commenter"=>"Maisiteng", "body"=>"鏄痉鍥�"} permitted: false>, "commit"=>"Create Comment", "controller"=>"comments", "action"=>"create", "article_id"=>"3"} permitted: false>
    # puts params.require(:comment).permit(:commenter, :body)
    # {"commenter"=>"Maisiteng", "body"=>"鍏徃鍙戠殑"}
    # puts @comment.inspect
    # <Comment id: 16, commenter: "Maisiteng", body: "鐨勬拻鏃�", article_id: 3, created_at: "2019-10-30 03:26:01", updated_at: "2019-10-30 03:26:01">
    redirect_to article_path(@article)
  end

  def destroy
    # render plain: params.inspect
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end

end
