# frozen_string_literal: true

require_relative "test_helper"

class TestHexletCode < Minitest::Test
  User = Struct.new(:name, :job, :gender, keyword_init: true)

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

  def test_for_form_for_long
    user = User.new name: "rob", job: "hexlet", gender: "m"
    result =
      HexletCode.form_for user, class: "hexlet-form" do |f|
        f.input :name, class: "user-input"
        f.input :job, as: :text
      end

    assert_string = "<form method=\"post\" class=\"hexlet-form\" action=\"#\"><input type=\"text\" " \
                    "class=\"user-input\" value=\"rob\"><textarea cols=\"20\" rows=\"40\" " \
                    "as=\"text\">hexlet</textarea></form>"
    assert result == assert_string
  end

  def test_for_form_for_short
    user = User.new name: "rob", job: "hexlet", gender: "m"
    result =
      HexletCode.form_for user, url: "#" do |f|
        f.input :job, as: :text, rows: 50, cols: 50
      end

    assert_string = "<form method=\"post\" action=\"#\"><textarea cols=\"50\" rows=\"50\" " \
                    "as=\"text\">hexlet</textarea></form>"
    assert result == assert_string
  end

  def test_for_form_for_err_age
    user = User.new name: "rob", job: "hexlet", gender: "m"
    result =
      HexletCode.form_for user, url: "#" do |f|
        f.input :name
        f.input :job, as: :text
        # Поля age у пользователя нет
        f.input :age
      end

    assert_string = "<form method=\"post\" action=\"#\"><input type=\"text\" value=\"rob\"><textarea cols=\"20\" " \
                    "rows=\"40\" as=\"text\">hexlet</textarea><input type=\"text\" value=\"\"></form>"
    assert result == assert_string
  end
end
