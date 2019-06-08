# This class would be used to manipulate an image
class Image
  def initialize(array)
    @array = array
  end

  def indexer
    ones = []
    @array.each_with_index do |value, index|
      value.each_with_index do |num, col|
        ones << [index, col] if num == 1
      end
    end
    ones
  end

  def in_bound?(row, col)
    # puts "#{__method__}: row = #{row}, col = #{col}"
    row_range = 0...@array.length
    return false if row > @array.length - 1
      col_range = 0...@array[row].length
    row_range.cover?(row) && col_range.cover?(col)
  end

  def set_pixel_north(row, col)
    if in_bound?(row - 1, col)
      @array[row - 1][col] = 1
    end
  end

  def set_pixel_south(row, col)
    # puts "#{__method__}: row = #{row}, col = #{col}"
    if in_bound?(row + 1, col)
      @array[row + 1][col] = 1
    end
  end

  def set_pixel_west(row, col)
    if in_bound?(row, col - 1)
      @array[row][col - 1] = 1
    end
  end

  def set_pixel_east(row, col)
    if in_bound?(row, col + 1)
      @array[row][col + 1] = 1
    end
  end

  def blur
    indexer.each do |row, col|
      set_pixel_north(row, col)
      set_pixel_west(row, col)
      set_pixel_east(row, col)
      set_pixel_south(row, col)
    end
  end

  def output_image
    @array.each do |array|
      puts array.join
    end
  end
end

image = Image.new(
  [
    [0, 0, 0, 0, 0, 0, 0, 1],
    [0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 1, 0, 0, 0, 0, 1],
    [0, 0, 0, 0, 0, 0, 0, 1],
    [0, 0, 1, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0],
    [1, 0, 0, 0, 0, 0, 0, 0]
  ]
)

image.blur
image.output_image
