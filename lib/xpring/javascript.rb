# frozen_string_literal: true

require "json"

module Xpring
  # Basic Ruby to Javascript interop
  module Javascript
    ENTRY_POINT = "XpringCommonJS"
    LIBRARY_PATH = File.expand_path("./javascript/library.js", __dir__)

    # @yieldreturn [String]
    # @return [Hash<Symbol, Object>, String, nil]
    def self.run
      script = prepare(yield)
      Xpring.debug_log(script)
      raw = IO.popen("node -p #{script.dump}", &:readlines).first&.strip
      parse(raw)
    end

    def self.parse(result)
      from_json = begin
                    JSON.parse(result)
                  rescue JSON::ParserError
                  end
      if from_json.respond_to?(:transform_keys)
        from_json.transform_keys(&:to_sym)
      else
        from_json
      end
    end
    private_class_method :parse

    def self.prepare(script)
      [
        inject_library,
        add_stringify_to(script),
      ].join.strip.tr("\"", "\\\"").tr("\n", "")
    end
    private_class_method :prepare

    def self.add_stringify_to(script)
      script.strip.split(";").tap do |script_array|
        script_array[-1] = "JSON.stringify(#{script_array[-1]})"
      end.join(";").concat(";")
    end
    private_class_method :add_stringify_to

    def self.inject_library
      <<~JAVASCRIPT
        const #{ENTRY_POINT} = require('#{LIBRARY_PATH}');
      JAVASCRIPT
    end
    private_class_method :inject_library
  end
end
