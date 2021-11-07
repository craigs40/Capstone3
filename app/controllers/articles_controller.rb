class ArticlesController < ApplicationController
  before_action :authenticate_user!

  def new
    @article = Article.new
  end

  def index
    @articles = Article.order(created_at: :desc)
    @popular = Vote.popular
    @categories = Category.all

    cat = params[:cat]
    if !cat.nil?
      @articles = Article.where(:category_id => cat)
    else
      @articles = Article.order(created_at: :desc)
    end
  end

  def create
    @article = Article.create(article_params)
    if @article.save
      redirect_to @article, notice: 'Article Saved!'
    else
      redirect_to new_article_path, alert: 'Article could not be saved.'
    end
  end

  def vote
    @article = Article.find(params[:id])
    @vote = current_user.votes.new(vote_params)
    if @vote.save
      redirect_to article_path(@article), notice: 'You liked this article!'
    else
      redirect_to article_path(@article), alert: 'Error.'
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article, notice: 'Article Updated!'
    else
      redirect_to @article, alert: 'Article could not be updated.'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to action: :index, notice: 'Article Deleted.'
  end

  private

  def article_params
    params.require(:article).permit(:title, :subtitle, :content, :image, :category_id)
  end
end
