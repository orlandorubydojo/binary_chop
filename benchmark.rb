require 'benchmark'
require './karate.rb'
max = 10000000
array = (1..max).to_a
bruce_lee = Karate.new(array)
guess = rand(max)

Benchmark.bm(30) do |x|
  x.report("chop using recursion")  { bruce_lee.chop(guess) }
  x.report("chop using loop")       { bruce_lee.chop_without_recursion(guess) }
end