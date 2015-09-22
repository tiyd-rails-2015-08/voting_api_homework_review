require 'test_helper'

class CandidateTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def test_candidate
    assert Candidate
  end

  def test_candidate_name
    c = Candidate.create(name: "Porkbelly Pete")
    assert c.name
  end

  def test_candidate_party
    c = Candidate.create(party: "Republicrat")
    assert c.party
  end

end
