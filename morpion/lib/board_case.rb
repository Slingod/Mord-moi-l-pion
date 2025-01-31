class BoardCase
  attr_accessor :position, :content

  def initialize(position)
    @position = position
    @content = ' '
  end
end
