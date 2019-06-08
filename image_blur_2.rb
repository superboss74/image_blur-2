# This class would be used to manipulate an image
class Image
  def initialize(array)
    @array = array
  end

  def num_rows
    @array.length
  end

  def num_cols(row)
    @array[row].length
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

  def inbound(row, col)
    col <= (@array[row - 1].length - 1)
  end

  def set_pixel_north(row, col)
    @array[row - 1][col] = 1 if row - 1 >= 0 && inbound(row, col)
  end

  def set_pixel_south(row, col)
    @array[row + 1][col] = 1 if (row + 1 < num_rows - 1) && inbound(row, col)
  end

  def set_pixel_west(row, col)
    @array[row][col - 1] = 1 if col - 1 >= 0
  end

  def set_pixel_east(row, col)
    @array[row][col + 1] = 1 if col + 1 < num_cols(row)
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
    [0, 0, 0, 1, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 1],
    [0, 0, 1, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0],
    [1, 0, 0, 0, 0, 0, 0, 0]
  ]
)

image.blur
image.output_image
