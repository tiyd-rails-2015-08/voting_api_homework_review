class Voter < ActiveRecord::Base
  has_one :vote
  validates :name, :party, presence: true

  private def generate_access_token
    begin
      self.access_token = SecureRandom.hex
    end while self.class.exists?(access_token: access_token)
  end

end
