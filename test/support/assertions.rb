# frozen_string_literal: true

module Assertions
  protected

  def assert_equal_set(expected, actual)
    assert_equal(Set.new(expected), Set.new(actual))
  end
end
