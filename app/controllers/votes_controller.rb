class VotesController < ApplicationController

  def index
    # respond_to do |format|
    # format.html
    # format.json {render json: Candidate.all.to_json}
    render json: Vote.all.to_json
  end

  def create
    voter = Vote.new(voter_id: params[:voter_id], candidate_id: params[:candidate_id])
    if voter.save
      render json: voter.to_json
    else
      render json: voter.errors
    end
  end

  # def destroy
  #   voter = Vote.find_by(access_token: params[:access_token])
  #   voter.vote.destroy
  #   render json: "Seek and destroy complete!"
  # end

end
