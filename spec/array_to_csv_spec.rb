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

  describe ".to_csv(io)" do

    subject { ArrayToCsv.new([{:key1 => 'value1'}, {:key2 => 'value2'}]) }

    it "should stream output to provided io object" do
      io = double
      expect(io).to receive(:write).with("key1,key2\n")
      expect(io).to receive(:write).with("value1,\n")
      expect(io).to receive(:write).with(",value2\n")
      expect(io).to receive(:close)
      subject.to_csv(io)
    end

    it "should return nil" do
      io = double :write => nil, :close => nil
      expect(subject.to_csv(io)).to be_nil
    end

  end

  describe ".to_csv(file_path)" do

    subject { ArrayToCsv.new([{:key1 => 'value1'}, {:key2 => 'value2'}]) }
    let(:csv_output) { "key1,key2\nvalue1,\n,value2\n" }
    let(:test_path) { "/tmp/array_to_csv_test_output.csv" }

    it "should write CSV to file" do
      subject.to_csv test_path
      expect(File.read(test_path)).to eq(csv_output)
    end

  end

end