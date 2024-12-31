class Blog < ApplicationRecord
  enum :posts_status, { post_unpublished: 0, post_published: 1 }
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates_presence_of :title, :body

  belongs_to :topic
end
