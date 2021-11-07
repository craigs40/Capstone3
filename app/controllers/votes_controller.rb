class VotesController < ApplicationController
  def create
    @vote = current_user.votes.new(vote_params)
    if @vote.save
      redirect_to @vote.article, notice: 'You liked this article!'
    else
      redirect_to article_path(@article), alert: 'Error.'
    end
  end

  def destroy
    @vote = current_user.votes.find(params[:id])
    article = @vote.article
    @vote.destroy
    redirect_to article
  end

  private

  def vote_params
    params.require(:vote).permit(:article_id)
  end
end
