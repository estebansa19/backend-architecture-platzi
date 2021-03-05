class Camera < Product
  attr_accessor :iso, :flash, :type

  def post_initialize(args)
    @iso = args[:iso]
    @flash = args[:flash]
    @type = args[:type]
  end

  def get_content
    "Name: #{name}, type: #{type}"
  end
end
