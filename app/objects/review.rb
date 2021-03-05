class Review
  attr_accessor :title, :content, :author, :product

  def initialize(title:, content:, author:, product:)
    @title = title
    @content = content
    @author = author
    @product = product
  end
end
