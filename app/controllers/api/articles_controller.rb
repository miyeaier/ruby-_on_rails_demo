class Api::ArticlesController < ApplicationController
  def index
    articles = Article.all
    render json: { articles: articles }
  end

  def show
    article = Article.find(params["id"])
    render json: { article: article } # Moreng 200
  end

  def create
    new_article = Article.create(article_params)#这个和下面pravit里第一个测试的呼应
    #上面的code 和下面的四行一样 上面简写
    #new_article = Article.new
    #new_article.title = params[:article][:title]
    #new_article.body = params[:article][:body]
    #new_article.save
  
    render json: { article: new_article }, status: 201
  end

  private

  def article_params
    params[:article].permit(:title,:body)#sanitaizing paramiter
  end
end
