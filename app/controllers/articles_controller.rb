class ArticlesController < ApplicationController
  http_basic_authenticate_with name: "xmz", password: "123", except: [:index, :show]

  def index
    @articles = Article.all
    @articles.reverse_each do |article|
      puts article.article_img
    end
  end

  def show
    @article = Article.find(params[:id])
    puts "hello我知道了"
  end

  def new
    @article = Article.new
    puts "nihao有点冲突"
  end

  def edit
    @article = Article.find(params[:id])
    puts "没有冲突"
  end

  def create
    #显示params参数
    #render plain: params[:article].inspect
    # 模型初始化、数据库字段的自动映射
    #@article = Article.new(params[:article])
    #@article = Article.new(params.require(:article).permit(:title, :text))
    @article = Article.new(article_params)
    #模型保存到数据库，返回布尔值
    #@article.save
    #页面重定向
    #redirect_to @article
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to    @article                  #controller: 'articles', action: 'show'
    else
      render 'edit'
    end
  end


  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  private
    def article_params
      params.require(:article).permit(:title, :text)
    end
end
