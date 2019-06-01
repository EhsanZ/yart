class Post < ApplicationRecord
  belongs_to :project, optional: true
  has_one_attached :image

  validates :text,
            length: { maximum: 700 }

  validate :content_presence

  belongs_to :user
  belongs_to :project, optional: true

  acts_as_votable

  include Commentable

  # Custom validators
  def content_presence
    errors.add(:base, "a post should have content") unless content?
  end

  def content?
    !text.blank? || image.attached?
  end

  def ordered_comments
    comments.order(created_at: "desc")
  end
end
