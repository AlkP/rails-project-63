# frozen_string_literal: true

module HexletCode
  module Tags
    # Represents Form class for tags
    class Form < Base
      def initialize(object) # rubocop:disable Lint/MissingSuper
        # super
        @object = object
        @fields = []
      end

      def input(name, options = {})
        #
        # Не понял дял чего вызывать ошибку в программе, обабатываю
        # value = @object.send(name)
        #
        value = @object.respond_to?(name) ? @object.send(name) : nil
        type = options[:as] || :input
        clazz = Object.const_get("HexletCode::Tags::Forms::#{type.capitalize}")
        field = clazz.build(options) { value }

        @fields << field
      end

      class << self
        def closing
          true
        end

        def default_options
          { method: "post" }
        end

        def build(object, options = {}, &block)
          obj = Form.new(object)
          # byebug
          [
            "<#{tag}#{prepared_attrs(options.merge(action: options[:url] || "#").except(:url))}>",
            block ? (yield obj) : nil,
            block ? "</#{tag}>" : nil
          ].join
        end
      end
    end
  end
end
