class MyValidator < ActiveModel::Validator
  def validate(post)
    unless post.title =~ /Won't Believe|Secret|Guess|Top \d/
      post.errors[:title] << "This title isn't clickbait-y enough!"
    end
  end
end


class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ['Fiction', 'Non-Fiction'] }
  include ActiveModel::Validations
  validates_with MyValidator
end
