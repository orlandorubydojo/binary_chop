require './karate.rb'

describe Karate do
  describe :initialize do
    it "should have a sorted array" do
      expect(Karate.new([5,4,3,2,1]).sorted_array).to eq([1,2,3,4,5])
    end
  end

  describe :chop do
    it "should return the index if it is the middle" do
      bl = Karate.new([1,2,3,4,5])
      expect(bl.chop(3)).to eq(2)
    end
  end

  describe :middlize do
    it "should find middle of the array" do
      judo = Karate.new([5,4,3,2,1])
      expect(judo.middlize(judo.sorted_array)).to eq(2)
    end

    it "should find the number of the first half" do
      judo = Karate.new([5,4,3,2,1])
      expect(judo.chop(1)).to eq(4)
    end
  end


end
