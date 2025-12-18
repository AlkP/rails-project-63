# frozen_string_literal: true

module HexletCode
  module Tags
    # Represents base class for tags
    class Base
      class << self
        def closing
          false
        end

        def tag
          @tag ||= name.split("::").last.downcase
        end

        def default_options
          {}
        end

        def prepared_attrs(options)
          attrs = default_options.merge(options)
          attrs.map { |k, v| " #{k}=\"#{v}\"" }.join
        end

        def build(options = {}, &block)
          [
            "<#{tag}#{prepared_attrs(options)}>",
            block ? yield : nil,
            block || closing ? "</#{tag}>" : nil
          ].join
        end
      end
    end
  end
end
