require "rails_helper"

RSpec.describe Post, type: :model do
  it "validates the length of text" do
    is_expected.to validate_length_of(:text).is_at_most(700)
  end

  it "validates that the post has either an image or text or both" do
    post = FactoryBot.build(:post, text: "")
    expect(post).to_not be_valid
  end
end
