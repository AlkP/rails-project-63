# frozen_string_literal: true

module HexletCode
  module Tag
    # Represents Div class for tags
    class Div < Base
      def build(options = {}, &block)
        [
          "<#{tag}#{options.map { |k, v| " #{k}=\"#{v}\"" }.join}>",
          block ? yield : nil,
          "</#{tag}>"
        ].join
      end
    end
  end
end
