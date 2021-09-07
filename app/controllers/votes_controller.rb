class VotesController < ApplicationController
  before_action :authenticate_user!

  def create
    @vote = current_user.votes.new(article_id: params[:article_id])

    if @vote.save
      redirect_to articles_path, notice: 'You liked a post.'
    else
      redirect_to articles_path, notice: 'You cannot like this post.'
    end
  end
end
