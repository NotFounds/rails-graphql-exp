D = Steep::Diagnostic

target :app do
  signature "sig"

  repo_path '.gem_rbs_collection'
  check "app/models/**/*.rb"
  check "app/controllers/**/*.rb"
  check 'app/services/**/*.rb'
  #check "app/graphql/**/*.rb"

  library "pathname", "json", "logger", "uri", 'singleton', 'fileutils', 'find', 'digest', 'prettyprint', 'yaml', "psych", "securerandom"
  library "actionpack", "activemodel", "activerecord", "actionview", "activesupport"
  library 'faraday'

  # 一旦型エラーは無視
  configure_code_diagnostics do |hash|
    hash[D::Ruby::NoMethod] = :information
    hash[D::Ruby::ArgumentTypeMismatch] = :information
    hash[D::Ruby::MethodDefinitionMissing] = :warning
    hash[D::Ruby::UnknownConstant] = :information
    hash[D::Ruby::UnexpectedPositionalArgument] = :information
  end
end
