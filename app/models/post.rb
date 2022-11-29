class Post < ApplicationRecord

    validates :title, presence: true
    validate :is_clickbait
    validates :content, length: { minimum: 250}
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: ["Fiction", "Non-Fiction"]

    def is_clickbait
        if title.present?
            if !((title.include? "Won't Believe") || (title.include? "Secret") || (title.include? "Top ") || (title.include? "Guess"))
                errors.add(:title, "Not Clickbait enough")
            end
        end
    end

end
