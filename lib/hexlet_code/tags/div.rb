# frozen_string_literal: true

module HexletCode
  module Tags
    # Represents Div class for tags
    class Div < Base
      class << self
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
end
