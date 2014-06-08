class ArrayToCsv

  def initialize array, csv_lib=choose_csv_lib
    @array = array
    @csv = csv_lib
  end

  def to_csv
    @csv.generate do |csv|
      each_row do |row|
        csv << row
      end
    end
  end

  private

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

