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
      redirect_to action: 'index', notice: 'Event Saved!'
    else
      redirect_to action: 'new', notice: 'Event could not be saved.'
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  private

  def article_params
    params.require(:article).permit(:title, :text, :image)
  end
end
