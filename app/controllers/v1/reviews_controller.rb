require 'google/cloud/datastore'
require 'reviews_wrapper'

module V1
  class ReviewsController < ApplicationController
    def index
      query = datastore.query('Review')
      reviews = datastore.run(query)

      render json: ReviewsWrapper.wrap_collection(reviews), status: :ok
    end
  
    def create
      if valid_for_create?
        review = datastore.entity 'Review' do |r|
          r[:title] = review_params[:title]
          r[:content] = review_params[:content]
          r[:author] = review_params[:author]
          r[:product] = review_params[:product].to_json
        end
  
        datastore.save review

        render json: ReviewsWrapper.wrap_once(review), status: :created
      else
        render json: { error: 'All attributes required' }, status: :unprocessable_entity
      end
    end
  
    private
  
    def review_params
      params.require(:review).permit(:title, :content, :author, product: [:id, :name])
    end
  
    def valid_for_create?
      review_params[:title].present? && 
        review_params[:content].present? && 
        review_params[:author].present? && 
        review_params[:product].present?
    end
  
    def datastore
      @datastore ||= Google::Cloud::Datastore.new
    end
  end
end
