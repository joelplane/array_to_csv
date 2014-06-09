class ArrayToCsv

  def initialize array, csv_lib=choose_csv_lib
    @array = array
    @csv = csv_lib
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

  def to_csv_io io
    each_row do |row|
      write_line io, row
    end
    io.close
    nil
  end

  def write_line io, row
    io.write @csv.generate_line row
  end

  def each_row
    yield head
    @array.each do |hash|
      yield row_from_hash hash
    end
  end

  def head
    @head_from_array ||= [].tap do |keys|
      seen_keys = {}
      @array.each do |hash|
        hash.keys.each do |key|
          unless seen_keys[key]
            seen_keys[key] = true
            keys << key
          end
        end
      end
    end
  end

  def row_from_hash hash
    hash.values_at(*head)
  end

  def choose_csv_lib
    if RUBY_VERSION =~ /^1\.8/
      FasterCSV
    else
      CSV
    end
  end

end

