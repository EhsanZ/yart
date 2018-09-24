class Comment < ApplicationRecord
  belongs_to :project, optional: true
  belongs_to :post, optional: true
  belongs_to :user

  validates :text,
            presence: true,
            length: { maximum: 500 }

  validate :belongs_to_post_or_project

  def belongs_to_post_or_project
    if project_id.nil? && post_id.nil?
      errors.add(:base, "comment should belongs either to a post or a project")
    end
  end
end