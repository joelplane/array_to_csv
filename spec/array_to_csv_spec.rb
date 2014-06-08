if RUBY_VERSION =~ /^1\.8/
  require 'fastercsv'
else
  require 'csv'
end
require 'array_to_csv'

describe ArrayToCsv do

  describe ".to_csv" do

    context "given an empty array" do
      it "should produce an empty CSV" do
        expect(ArrayToCsv.new([]).to_csv).to eq("\n")
      end
    end

    context "given an array of one empty hash" do
      it "should produce an empty CSV" do
        expect(ArrayToCsv.new([{}]).to_csv).to eq("\n\n")
      end
    end

    context "given an array of one hash" do
      it "should produce a one-value-row CSV" do
        expect(ArrayToCsv.new([{:key => 'value'}]).to_csv).to eq("key\nvalue\n")
      end
    end

    context "given an array of two hashes" do
      it "should produce a CSV with two value rows" do
        expect(ArrayToCsv.new([{:key => 'value1'}, {:key => 'value2'}]).to_csv).to eq("key\nvalue1\nvalue2\n")
      end
    end

    context "given an array of two hashes with different keys" do
      it "should produce a CSV with column headings combined from both hash keys, and two value rows" do
        expect(ArrayToCsv.new([{:key1 => 'value1'}, {:key2 => 'value2'}]).to_csv).to eq("key1,key2\nvalue1,\n,value2\n")
      end
    end

  end

end