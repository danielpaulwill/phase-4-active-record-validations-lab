class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :title_is_click_bait

  title = self.title
  puts title

  def title_is_click_bait
    title = self.title
    if title.where('title.include = ?', "Won't Believe" || "Secret" || "Top [number]" || "Guess")
      puts "all clear"
    else
      errors.add(:title, "Not click bait-y enough!")
  end
  
end
