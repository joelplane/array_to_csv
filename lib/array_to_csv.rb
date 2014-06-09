class ArrayToCsv

  require 'array_to_csv/csv_writer'

  def initialize array, csv_lib=nil
    @array = array
    @csv_lib = csv_lib
  end

  # @return [String, nil]
  def to_csv io=nil
    io ? to_csv_io(io) : to_csv_string
  end

  private

  # @return [String]
  def to_csv_string
    StringIO.new.tap do |string_io|
      self.to_csv string_io
    end.string
  end

  # @return [nil]
  def to_csv_io io
    CsvWriter.new(@array, io, @csv_lib).write
  end

end

