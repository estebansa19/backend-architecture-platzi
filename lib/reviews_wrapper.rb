class ReviewsWrapper
  class << self
    def wrap_collection(reviews)
      reviews.map do |review|
        wrap_record(review)
      end
    end
  
    def wrap_once(review)
      wrap_record(review)
    end
  
    private
  
    def wrap_record(review)
      {
        id: review.key.id,
        title: review[:title],
        content: review[:content],
        author: review[:author],
        product: JSON.parse(review[:product])
      }
    end
  end
end
