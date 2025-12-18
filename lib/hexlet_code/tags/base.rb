# frozen_string_literal: true

module HexletCode
  module Tags
    # Represents base class for tags
    class Base
      class << self
        def tag
          @tag ||= name.split("::").last.downcase
        end

        def build(options = {}, &block)
          [
            "<#{tag}#{options.map { |k, v| " #{k}=\"#{v}\"" }.join}>",
            block ? yield : nil,
            block ? "</#{tag}>" : nil
          ].join
        end
      end
    end
  end
end
