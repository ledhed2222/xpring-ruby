# frozen_string_literal: true

require "json"

module Xpring
  module Javascript
    LIBRARY_PATH = File.expand_path("../../../ext/xpring/xpring.js", __FILE__)

    def self.run
      script = prepare(yield)
      raw = IO.popen("node -p \"#{script}\"") do |io|
        io.readlines
      end.first.strip
      parse(raw)
    end

    def self.parse(result)
      from_json = begin
                    JSON.parse(result)
                  rescue JSON::ParserError
                  end
      if from_json.is_a?(Hash)
        from_json.transform_keys(&:to_sym)
      else
        from_json
      end
    end
    private_class_method :parse

    def self.prepare(script)
      [
        library,
        add_stringify_to(script),
      ].join("\n")
    end
    private_class_method :prepare

    def self.add_stringify_to(script)
      script.strip.split(";").tap do |script_array|
        script_array[-1] = "JSON.stringify(#{script_array[-1].tr(";", "")});"
      end.join(";\n")
    end
    private_class_method :add_stringify_to

    def self.library
      # props to:
      # https://www.scriptol.com/javascript/include.php
      <<-JAVASCRIPT
      const fs = require('fs');
      const vm = require('vm');
      vm.runInThisContext(fs.readFileSync('#{LIBRARY_PATH}'));
      JAVASCRIPT
    end
    private_class_method :library
  end
end

