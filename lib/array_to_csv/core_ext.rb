require 'array_to_csv'
if RUBY_VERSION =~ /^1\.8/
  require 'fastercsv'
else
  require 'csv'
end

class Array

  def to_csv
    ArrayToCsv.new(self).to_csv
  end

end