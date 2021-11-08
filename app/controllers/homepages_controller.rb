class HomepagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @popular = Vote.popular
    @article = Article.find(params[:id])
    @recent_business_article = Article.where('(category_id = ?)', 1).order('created_at').last
    @recent_sports_article = Article.where('(category_id = ?)', 2).order('created_at').last
    @recent_fashion_article = Article.where('(category_id = ?)', 3).order('created_at').last
    @recent_entertainment_article = Article.where('(category_id = ?)', 4).order('created_at').last
  end

  private

  def article_params
    params.require(:article).permit(:title, :subtitle, :content, :image, :category_id)
  end
end
