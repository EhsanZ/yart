require "rails_helper"

RSpec.describe PostsController, type: :request do
  let!(:user) { FactoryBot.create(:user) }

  before do
    sign_in user
  end

  describe "#create" do
    it "creates post" do
      params = { post: FactoryBot.attributes_for(:post) }
      expect { post "/posts", params: params }.to(
        change(Post, :count).by(1),
      )
    end
  end

end
