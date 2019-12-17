class ArticlesController < ApplicationController

#  before_action :set_article, only: [:edit, :update, :show, :destroy]

  def index
    if (!params[:search_text].nil?)
      if (!params[:search_text].empty?)
        search
      else
        @articles = Article.order(:description).page(params[:page])
      end
    else
      @articles = Article.order(:description).page(params[:page])
    end

    if @articles.empty?
      redirect_to new_article_path
    end
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def show
    @article = Article.find(params[:id])
    render 'show'
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = "Article was successfully updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  def search
    @articles = Article.where("description LIKE ?", "%" + params[:search_text] + "%").order(:title).page(params[:page])
    #articles_t = Article.where("title LIKE ?", "%" + params[:search_text] + "%")
    #articles = articles_d.merge(articles_t)
    #@articles = articles.order(:description).page(params[:page])
    render 'search'
  end


  private


  def article_params
    params.require(:article).permit(:title, :description, :user_id)
  end

end
