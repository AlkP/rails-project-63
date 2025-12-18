# frozen_string_literal: true

module HexletCode
  module Tags
    module Forms
      # Represents input class for tags
      class Input < Base
        class << self
          def default_options
            { type: "text" }
          end

          def prepared_attrs(options, &block)
            attrs = default_options.merge(options)
                                   .merge(block ? { value: yield } : {})
            attrs.map { |k, v| " #{k}=\"#{v}\"" }.join
          end

          def build(options = {}, &block)
            "<#{tag}#{prepared_attrs(options, &block)}>"
          end
        end
      end
    end
  end
end
