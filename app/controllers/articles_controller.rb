class ArticlesController < ApplicationController
  before_action :authenticate_user!

  def new
    @article = Article.new
  end

  def index
    @articles = Article.all
  end

  def create
    @article = Article.create(article_params)
    if @article.save
      redirect_to @article, notice: 'Article Saved!'
    else
      render :new, notice: 'Article could not be saved.'
    end
  end

  def vote
    @article = Article.find(params[:id])
    @vote = Vote.create(user_id: current_user.id, article_id: @article.id)

    if @vote.save
      redirect_to article_path(@article), notice: 'You liked this article!'
    else
      redirect_to article_path(@article), alert: 'Error.'
    end
  end

  def show
    @articles = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article, notice: 'Article Updated!'
    else
      render :edit, alert: 'Article could not be updated.'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @blog.destroy
    redirect_to action: :new, notice: 'Article Deleted.'
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :image, :category_id)
  end
end
