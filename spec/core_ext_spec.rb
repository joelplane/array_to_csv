if RUBY_VERSION =~ /^1\.8/
  require 'fastercsv'
else
  require 'csv'
end
require 'array_to_csv/core_ext'

describe "array_to_csv/core_ext" do

  it "should add to_csv method to Array class" do
    expect([]).to respond_to :to_csv
  end

  it "should cause Array#to_csv to delegate to ArrayToCsv#to_csv" do
    array = [{:key => 'value'}]
    expect(array.to_csv).to eq(ArrayToCsv.new(array).to_csv)
  end

end