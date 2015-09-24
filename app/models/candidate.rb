class Candidate < ActiveRecord::Base
  has_many :votes
  validates :name, presence: true, uniqueness: true
  validates :hometown, :district, :party, presence: true
end
