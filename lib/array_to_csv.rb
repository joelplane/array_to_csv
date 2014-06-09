class ArrayToCsv

  require 'array_to_csv/csv_writer'

  def initialize array, csv_lib=nil
    @array = array
    @csv_lib = csv_lib
  end

  # @return [String, nil]
  def to_csv io_or_file_path=nil
    case io_or_file_path
      when nil
        to_csv_string
      when String
        to_csv_file io_or_file_path
      else
        to_csv_io io_or_file_path
    end
  end

  private

  # @return [String]
  def to_csv_string
    StringIO.new.tap do |string_io|
      self.to_csv string_io
    end.string
  end

  def to_csv_file file_path
    file_io = File.open(file_path, 'w')
    self.to_csv file_io
  end

  # @return [nil]
  def to_csv_io io
    CsvWriter.new(@array, io, @csv_lib).write
  end

end

