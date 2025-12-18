# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)

require_relative "../lib/hexlet_code"
require_relative "../lib/hexlet_code/version"
require_relative "../lib/hexlet_code/tags/base"
require_relative "../lib/hexlet_code/tags/br"
require_relative "../lib/hexlet_code/tags/div"
require_relative "../lib/hexlet_code/tags/img"
require_relative "../lib/hexlet_code/tags/label"
require_relative "../lib/hexlet_code/tags/form"
require_relative "../lib/hexlet_code/tags/forms/input"
require_relative "../lib/hexlet_code/tags/forms/text"

require "minitest/autorun"
require "byebug"
