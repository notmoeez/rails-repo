module Placeholder
  extend ActiveSupport::Concern

  def self.image_generator(height:, width:)
    "https://placehold.co/#{height}x#{width}"
  end
end
