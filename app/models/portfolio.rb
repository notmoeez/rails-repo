class Portfolio < ApplicationRecord
  validates_presence_of :title, :subtitle, :body, :thumb_image, :main_image
end
