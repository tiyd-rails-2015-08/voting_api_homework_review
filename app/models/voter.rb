class Voter < ActiveRecord::Base
  before_create :generate_access_token
  has_one :vote
  validates :name, presence: true, uniqueness: true
  validates :party, presence: true

  private def generate_access_token
    #begin
      self.access_token = SecureRandom.hex
    #end while self.class.exists?(access_token: access_token)
  end

end
