require "rails_helper"

RSpec.describe User, type: :model do
  attr_reader :user
  context "a valid user" do
    before do
      @user = User.find_or_create_from_auth(oauth_data)
    end

    it "responds to 'find_or_create_by'" do
      expect(User).to respond_to(:find_or_create_by)
    end

    it "has a provider" do
      expect(user.provider).to eq "facebook"
    end

    it "has a uid" do
      expect(user.uid).to eq "5602546181"
    end

    it "has a username" do
      expect(user.username).to eq "Sky Fly"
      expect(user.username).to_not eq "slinky"
    end

    it "has an image" do
      expect(user.image_url).to eq "http://graph.facebook.com/6025461810/picture"
    end

    it "has a token" do
      expect(user.token)
    end
  end
end
