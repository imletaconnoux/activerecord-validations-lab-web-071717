class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content , length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: {in: ["Fiction", "Non-Fiction"], message: "Invalid Category"}
  validate :clickbait

  def clickbait
    if title != nil && !title.start_with?('Won\'t Believe', 'Secret', 'Top', 'Guess', 'You Won\'t')
      errors.add(:title, "Not Clickbait Title")
    end
  end
end
