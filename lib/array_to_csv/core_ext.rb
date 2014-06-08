require 'array_to_csv'

class Array

  def to_csv
    ArrayToCsv.new(self).to_csv
  end

end