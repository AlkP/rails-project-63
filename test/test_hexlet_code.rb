# frozen_string_literal: true

require_relative "test_helper"

class TestHexletCode < Minitest::Test
  User = Struct.new(:name, :job, keyword_init: true)

  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_presents_constants
    refute_nil ::HexletCode::Tag.build(:label, { asd: :dsa }) { "Test" }
  end

  def test_for_label_tag
    result = ::HexletCode::Tag.build(:label, { asd: :dsa })
    assert result == "<label asd=\"dsa\">"
  end

  def test_for_div_tag
    result = HexletCode::Tag.build(:div, { asd: :dsa })
    assert result == "<div asd=\"dsa\"></div>"
  end

  def test_for_alternative_div_tag
    result = HexletCode::Tags::Div.build({ asd: :dsa })
    assert result == "<div asd=\"dsa\"></div>"
  end

  def test_for_form_for
    user = User.new name: "rob"
    result =
      HexletCode.form_for user, class: "hexlet-form" do |f|
      end

    assert result == "<form action=\"#\" method=\"post\" class=\"hexlet-form\"></form>"
  end
end
