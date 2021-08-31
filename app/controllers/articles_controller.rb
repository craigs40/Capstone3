class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def index
    @article = Article.all
  end

  def create
    @article = current_user.created_events.build(event_params)
    if @article.save
      redirect_to action: 'index', notice: 'Article Saved!'
    else
      redirect_to action: 'new', notice: 'Article could not be saved.'
    end
  end

  def vote
    @article = Article.all.find(params[:id])
    Vote.create(user_id: current_user.id, article_id: @article.id)
    redirect_to article_path(@article)
  end

  def show
    @article = Article.find(params[:id])
  end

  private

  def article_params
    params.require(:article).permit(:title, :context, :image, :category)
  end
end
