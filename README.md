Binary Chop - aka Binary Search
===========

Ah, Sweet sweet Algorithms!  In this dojo we will be implementing a binary chop or better known as a binary
search algorithm. We will be searching for a number from an array of sorted numbers. If the number is found
then we will return the index value of the number. If the number is not found then we will return -1

Note: Implement the search iteratively

What is a Binary Chop?
=====================

From [wikipedia](http://en.wikipedia.org/wiki/Binary_search_algorithm):

"a binary search or half-interval search algorithm finds the position of a specified input value (the search "key")
within an array sorted by key value.  For binary search, the array should be arranged in ascending or descending order.
In each step, the algorithm compares the search key value with the key value of the middle element of the array.
If the keys match, then a matching element has been found and its index, or position, is returned. Otherwise,
if the search key is less than the middle element's key, then the algorithm repeats its action on the sub-array
to the left of the middle element or, if the search key is greater, on the sub-array to the right. If the remaining array
to be searched is empty, then the key cannot be found in the array and a special "not found" indication is returned.

A binary search halves the number of items to check with each iteration, so locating an item (or determining its absence)
takes logarithmic time. A binary search is a dichotomic divide and conquer search algorithm. "

IN LAYMAN'S TERMS:

We will be searching for a targeted number from an array of sorted numbers. The Algorithm will search for the number
by targeting the middle of the array first. If the search number is lower than the middle number then it will "half"
the array into a subset and continue the search. Or if the search number is higher than middle then it will do the same
with the higher half. It will continue the search until it can find the number or not.

Usage
=========

```ruby
numbers = (1..5).to_a

bruce_lee = Karate.new(numbers)
bruce_lee.chop(1) # => 0
bruce_lee.chop(5) # => 4
bruce_lee.chop(10) # => -1

```

Note: We are not worried about performance.

Extra Credit
============
Implement the search using recursion.
