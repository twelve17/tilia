# encoding: utf-8
require 'helper'

class Tilia::TestConcurrentRadixTree < Minitest::Test

  def test_creation
    assert_kind_of Tilia::ConcurrentRadixTree, Tilia::ConcurrentRadixTree.new
  end

  def test_put
    tree = Tilia::ConcurrentRadixTree.new
    tree.put("brakes", 5)
    tree.put("brake pads", 3)

    pairs = tree.get_key_value_pairs_for_keys_starting_with("nothere")
    assert pairs.empty?, "pairs empty when prefix does not match"

    pairs = tree.get_key_value_pairs_for_keys_starting_with("brakes")
    assert_equal(1, pairs.size, "pairs.size")
    assert_equal("brakes", pairs.first[0], "pairs.first key")
    assert_equal(5, pairs.first[1], "pairs.first value")

    pairs = tree.get_key_value_pairs_for_keys_starting_with("brake")
    assert_equal(2, pairs.size, "pairs.size")
    assert_equal("brake pads", pairs.first[0], "pairs.first key")
    assert_equal(3, pairs.first[1], "pairs.first value")
  end

end
