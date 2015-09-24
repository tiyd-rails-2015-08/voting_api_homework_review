class AddAccessTokenToVoters < ActiveRecord::Migration
  def change
    add_column :voters, :access_token, :string

    Voter.all.each do |v|
      v.update!(access_token: SecureRandom.hex)
    end
  end
end
