class VotesController < ApplicationController
  before_action :authenticate_user!

  def create
    @article = Article.find(params[:id])
    @vote = Vote.create(user_id: current_user.id, article_id: @article.id)
    redirect_to article_path(@article)

    if @vote.save
      redirect_to article_path(@article), notice: 'You liked this article!'
    else
      redirect_to article_path(@article), alert: 'Error.'
    end
  end
end
