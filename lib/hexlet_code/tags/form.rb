# frozen_string_literal: true

module HexletCode
  module Tags
    # Represents Form class for tags
    class Form < Base
      class << self
        def default_options
          { action: "#", method: "post" }
        end
      end
    end
  end
end
