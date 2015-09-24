class VotersController < ApplicationController

  def index
    # respond_to do |format|
    # format.html
    # format.json {render json: Candidate.all.to_json}
    render json: Voter.all
  end

  def create
    voter = Voter.new(name: params[:name], party: params[:party])
    if voter.save
      render json: voter
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
    voter = Voter.find(params[:id])
    if voter.access_token == params[:access_token]
      voter.name = params[:name] if params[:name]
      voter.party = params[:party] if params[:party]
      if voter.save
        render json: voter
      else
        render json: voter.errors
      end
    else
      render json: "Don't make me do a recount!"
    end
  end

end
