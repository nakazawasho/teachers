class Message < ApplicationRecord
  #asociation
  belongs_to :messageable, polymorphic: true

  #validation
  validates :text, presence: true

  def get_image
    if messageable.image.present?
      messageable.image
    else
      "no-image.jpg"
    end
  end

end
