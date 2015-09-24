class VotersController < ApplicationController

  def index
    # respond_to do |format|
    # format.html
    # format.json {render json: Candidate.all.to_json}
    render json: Voter.all.to_json
  end

  def create
    voter = Voter.new(name: params[:name])
    if voter.save
      render json: voter.to_json
    else
      render json: voter.errors
    end
  end

  def show
    voter = Voter.find(params[:id])
    if voter.access_token == params[:access_token]
      render json: voter
    else
      render json: "Don't make me do a recount"
    end
  end

  def update
    voter = Voter.find([name: params[:name], party: params[:party]])
    if voter.access_token == params[:access_token]
      render json: voter.to_json
    else
      render json: "Don't make me do a recount!"
    end
  end

end
