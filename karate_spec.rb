require './karate.rb'

describe Karate do
  before :all do
     Karate.send(:public, *Karate.private_instance_methods)
     Karate.send(:attr_accessor, :sorted_array, :default_range)
  end
  describe :initialize do
  
    it "stores sorted array in variable" do
      arr = [1,4,5,2,3]
      expect(Karate.new(arr).sorted_array).to eq(arr.sort!)
    end
    
    it "stores initial search range of array in variable" do
      arr = [1,2,3]
      expect(Karate.new(arr).default_range).to eq(0..(arr.size-1))
    end
    
  end
  
  describe :middle_of_range do
      it "returns nil for empty array" do
        expect(Karate.new([]).middle_of_range).to be_nil
      end
      
      it "returns first element if range length <3" do
        k1 = Karate.new([1])
        k12 = Karate.new([1,2])
        expect(k1.middle_of_range).to eq(0)
        expect(k12.middle_of_range).to eq(0)
      end
      
      it "returns middle element or left from even range's item if range length >2" do
        k4 = Karate.new([4,3,2,1])
        k3 = Karate.new([1,2,3])
        expect(k4.middle_of_range).to eq(1)
        expect(k3.middle_of_range).to eq(1)
      end
 
      it "returns last element at end of range" do
        k = Karate.new([])
        expect(k.middle_of_range(10..10)).to eq(10)
      end

      it "returns first element at beginning of range" do
        k = Karate.new([])
        expect(k.middle_of_range(0..0)).to eq(0)
      end
      
      it "returns middle of custom range" do
        k = Karate.new([])
        expect(k.middle_of_range(1..3)).to eq(2)
        expect(k.middle_of_range(1..4)).to eq(2)
        expect(k.middle_of_range(2..5)).to eq(3)
      end
      
  end
  
  describe :left_range do
    it "returns empty range if not enough items in range to split" do
      [[1],[1,2]].each { |a| expect(Karate.new(a).left_range.size).to eq(0)}
    end
    it "returns left range from excluded_index" do
      [[1,2,3],[1,2,3,4]].each { |a| expect(Karate.new(a).left_range).to eq(0..0)}
    end
  end

  describe :right_range do
    it "returns empty range if not enough items in range to split" do
      [[1]].each { |a| expect(Karate.new(a).right_range.size).to eq(0)}
    end
    it "returns right range" do
      expect(Karate.new((1..4).to_a).right_range).to eq(2..3)
      expect(Karate.new((1..5).to_a).right_range).to eq(3..4)
    end
    
    it "returns right range from excluded_index" do
      expect(Karate.new((1..4).to_a).right_range(2)).to eq(3..3)
      expect(Karate.new((1..5).to_a).right_range(1)).to eq(2..4)
    end
  end
  
  describe :chop do
    it "should pass tests from doc readme" do
      numbers = (1..5).to_a

      bruce_lee = Karate.new(numbers)
      expect(bruce_lee.chop(1)).to eq(0)
      expect(bruce_lee.chop(5)).to eq(4)
      expect(bruce_lee.chop(10)).to eq(-1)
    end
  end
  
  describe :chop_without_recursion do
    it "should pass tests from doc readme" do
      numbers = (1..5).to_a

      bruce_lee = Karate.new(numbers)
      expect(bruce_lee.chop_without_recursion(1)).to eq(0)
      expect(bruce_lee.chop_without_recursion(5)).to eq(4)
      expect(bruce_lee.chop_without_recursion(10)).to eq(-1)
    end
  end

end
