# frozen_string_literal: true

module HexletCode
  module Tags
    module Forms
      # Represents textarea class for tags
      class Text < Base
        class << self
          def tag
            "textarea"
          end

          def default_options
            { cols: "20", rows: "40" }
          end
        end
      end
    end
  end
end
