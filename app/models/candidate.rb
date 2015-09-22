class Candidate < ActiveRecord::Base
  has_many :votes
  validates :name, :party, presence: true
end
