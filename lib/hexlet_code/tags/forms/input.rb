# frozen_string_literal: true

module HexletCode
  module Tags
    module Forms
      # Represents input class for tags
      class Input < Base
        class << self
          def default_options
            { type: 'text' }
          end

          def build(options = {}, &block)
            attrs = default_options.merge(options).merge(block ? { value: yield } : {})
            "<#{tag}#{attrs.map { |k, v| " #{k}=\"#{v}\"" }.join}>"
          end
        end
      end
    end
  end
end
