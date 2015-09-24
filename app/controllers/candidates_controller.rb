class CandidatesController < ApplicationController
  def index
    # respond_to do |format|
    # format.html
    # format.json {render json: Candidate.all.to_json}
    render json: Candidate.all.to_json
  end

  def show
    id = params[:id]
    render json: Candidate.find(id).to_json
  end

  def create
    c = Candidate.new(name: params[:name], party: params[:party])
    if c.save
      render json: c.to_json
    else
      render json: c.errors
    end
  end

  def destroy
    id = params[:id]
    Candidate.find(id).destroy
    render json: "Seek and destroy complete!"
  end

end
