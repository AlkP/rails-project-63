# frozen_string_literal: true

require_relative "test_helper"

class TestHexletCode < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_presents_constants
    refute_nil ::HexletCode::Tags::Label.build({ asd: :dsa }) { "Test" }
  end

  def test_it_does_something_useful
    assert true
  end
end
