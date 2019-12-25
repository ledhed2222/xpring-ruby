# frozen_string_literal: true

# # Install script for js resources
# puts "Bundling JS for xpring"
#
# gem_dir = File.expand_path("../../..", __FILE__)
# js_dir = File.expand_path("xpring-common-js", gem_dir)
# lib_dir = File.expand_path("ext/xpring", gem_dir)
#
# Dir.chdir js_dir do
#   puts ">> Installing Node Dependencies"
#   `npm i`
#   puts ">> Done Installing Node Dependencies"
#
#   puts ">> Running Webpack"
#   `npm run webpack`
#   puts ">> Done Running Webpack"
#
#   puts ">> Copying Artifacts"
#   `cp dist/bundled.js #{File.expand_path("xpring.js", lib_dir)}`
#   puts ">> Done"
# end

