class Product
  attr_accessor :name, :manufacturer, :sku, :features

  def initialize(**args)
    @name = args[:name]
    @manufacturer = args[:manufacturer]
    @sku = args[:sku]
    @features = args[:features]
    post_initialize(args)
  end

  def get_content
    'example'
  end

  def post_initialize(args)
  end
end
