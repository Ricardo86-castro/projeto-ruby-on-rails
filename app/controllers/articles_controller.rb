class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]

  def index
    @articles = Article.all
  end

  def show

  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save then
      redirect_to @article
    else
      render :new
    end
  end

  def edit

  end

  def update

    if @article.update(article_params) then
      redirect_to @article
    else
      render :new
    end
  end

  def destroy
    @article = Article.find(params[:id])
    if @article.destroy
        flash[:success] = 'Object was successfully deleted.'
        redirect_to root_path
    else
        flash[:error] = 'Something went wrong'
        redirect_to articles_url
    end

end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end

  def set_article
    @article = Article.find(params[:id])
  end

end
