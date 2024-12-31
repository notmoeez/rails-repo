class Portfolio < ApplicationRecord
  validates_presence_of :title, :subtitle, :body, :thumb_image, :main_image

  def self.search_by_subtopic(subtopic)
    where(subtitle: subtopic)
  end

  scope :ruby_on_rails, -> { where(subtitle: "Ruby on Rails") }
end
