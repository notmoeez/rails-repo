class Portfolio < ApplicationRecord
  validates_presence_of :title, :subtitle, :body, :thumb_image, :main_image

  def self.search_by_subtopic(subtopic)
    where(subtitle: subtopic)
  end

  scope :ruby_on_rails, -> { where(subtitle: "Ruby on Rails") }

  after_initialize :set_defaults

  def set_defaults
    self.main_image ||= "https://placehold.co/600x400"
    self.thumb_image ||= "https://placehold.co/300x200"
  end
end
