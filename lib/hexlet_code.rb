# frozen_string_literal: true

# require "zeitwerk"
# loader = Zeitwerk::Loader.new
# loader.push_dir(File.expand_path("hexlet_code", __dir__))
# loader.setup

require_relative "../lib/hexlet_code/tags/base"
require_relative "../lib/hexlet_code/tags/br"
require_relative "../lib/hexlet_code/tags/div"
require_relative "../lib/hexlet_code/tags/img"
require_relative "../lib/hexlet_code/tags/label"
require_relative "../lib/hexlet_code/tags/form"
require_relative "../lib/hexlet_code/tags/forms/input"
require_relative "../lib/hexlet_code/tags/forms/text"

# Represents HexletCode class for tags
module HexletCode
  class Error < StandardError; end

  # Represents standard entry point
  class Tag
    class << self
      def build(name, options = {}, &block)
        clazz = Object.const_get("HexletCode::Tags::#{name.capitalize}")
        clazz.build(options, &block)
      end
    end
  end

  def self.form_for(object, options = {}, &block)
    ::HexletCode::Tags::Form.build(object, options, &block)
  end
end
