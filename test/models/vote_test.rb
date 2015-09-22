require 'test_helper'

class VoteTest < ActiveSupport::TestCase

  def test_vote
    assert Vote
  end

  def test_vote_has_candidate_id
    v = Vote.new(candidate_id: 1)
    assert 1, v
  end

  def test_vote_has_voter_id
    v = Vote.new(voter_id: 1)
    assert 1, v
  end

end
