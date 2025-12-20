# frozen_string_literal: true

module HexletCode
  module Tags
    # Represents Div class for tags
    class Div < Base
      class << self
        def closing?
          true
        end
      end
    end
  end
end
