class Portfolio < ApplicationRecord
  has_many :technologies
  accepts_nested_attributes_for :technologies, reject_if: lambda { |attrs| attrs["name"].blank? }
  include Placeholder
  validates_presence_of :title, :subtitle, :body, :thumb_image, :main_image

  def self.search_by_subtopic(subtopic)
    where(subtitle: subtopic)
  end

  scope :ruby_on_rails, -> { where(subtitle: "Ruby on Rails") }

  after_initialize :set_defaults

  def set_defaults
    self.main_image ||= Placeholder.image_generator(height: "600", width: "400")
    self.thumb_image ||= Placeholder.image_generator(height: "300", width: "200")
  end
end
