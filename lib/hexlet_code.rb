# frozen_string_literal: true

files = Dir["hexlet_code/**/*.rb"]
files.sort_by { |path| [path.split("/").size, path] }.each { |file| require_relative file }

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
