# frozen_string_literal: true

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "lib"))

require "asaas/version"

Gem::Specification.new do |s|
  s.name = "asaas"
  s.version = Asaas::VERSION
  s.required_ruby_version = ">= 2.3.0"
  s.summary = "Ruby bindings for the Asaas API"
  s.description = "Asaas is the easiest way to accept payments online.  " \
                  "See https://asaas.com for details."
  s.author = "Asaas"
  s.email = "support@asaas.com"
  s.homepage = "https://asaas.com/docs/api?lang=ruby"
  s.license = "MIT"

  s.metadata = {
    "bug_tracker_uri" => "https://github.com/asaas/asaas-ruby/issues",
    "changelog_uri" =>
      "https://github.com/asaas/asaas-ruby/blob/master/CHANGELOG.md",
    "documentation_uri" => "https://asaas.com/docs/api?lang=ruby",
    "github_repo" => "ssh://github.com/asaas/asaas-ruby",
    "homepage_uri" => "https://asaas.com/docs/api?lang=ruby",
    "source_code_uri" => "https://github.com/asaas/asaas-ruby",
    "rubygems_mfa_required" => "false",
  }

  ignored = Regexp.union(
    /\A\.editorconfig/,
    /\A\.git/,
    /\A\.rubocop/,
    /\A\.travis.yml/,
    /\A\.vscode/,
    /\Atest/
  )
  s.files = `git ls-files`.split("\n").reject { |f| ignored.match(f) }
  s.executables   = `git ls-files -- bin/*`.split("\n")
                                           .map { |f| File.basename(f) }
  s.require_paths = ["lib"]
end
