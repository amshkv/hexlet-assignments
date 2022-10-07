# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/stack'

class StackTest < Minitest::Test
  # BEGIN
  def setup
    @stack = Stack.new([1, 2, 3])
  end

  def test_initialize
    assert { @stack.to_a == [1, 2, 3] }
  end

  def test_pop
    assert { @stack.pop! == 3 }
    assert { @stack.to_a == [1, 2] }
  end

  def test_push
    @stack.push!(4)
    assert { @stack.to_a == [1, 2, 3, 4] }
  end

  def test_empty
    stack = Stack.new
    assert { stack.empty? }
    refute { @stack.empty? }
  end

  def test_clear
    @stack.clear!
    assert { @stack.empty? }
  end

  def test_size
    assert { @stack.size == 3 }
  end
  # END
end

test_methods = StackTest.new({}).methods.select { |method| method.start_with? 'test_' }
raise 'StackTest has not tests!' if test_methods.empty?
