require 'array_to_csv'
if RUBY_VERSION =~ /^1\.8/
  require 'fastercsv'
else
  require 'csv'
end

class Array

  def to_csv *args
    ArrayToCsv.new(self).to_csv *args
  end

end