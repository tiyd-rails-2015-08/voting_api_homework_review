require 'test_helper'

class VoterTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def test_voter
    assert Voter
  end

  def test_voter_name
    v = Voter.create(name: "Vanessa Voter")
    assert v.name
  end

  def test_voter_has_vote
    c = Candidate.new(name: "Dishonest Dan")
    v = Vote.new
    c.votes << v
    assert c.votes.include?(v)
  end
end
