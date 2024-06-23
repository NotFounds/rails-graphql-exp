return unless Rails.env.development?

require 'rbs_rails/rake_task'

namespace :rbs do
  task setup: %i[clean collection rbs_rails:all]
  # prototype+subtractを活用したいところだが、自前の型定義が必要になるため保留中
  # task setup: %i[clean collection prototype rbs_rails:all subtract]

  task :clean do
    sh 'rm', '-rf', 'sig/'
    sh 'rm', '-rf', '.gem_rbs_collection/'
  end

  task :collection do
    sh 'rbs', 'collection', 'update'
  end

  task :generate do
    sh 'rbs', 'prototype', 'rb', '--out-dir=sig', '--base-dir=.', 'app'
  end

  task :subtract do
    sh 'rbs', 'subtract', '--write', 'sig/app', 'sig/rbs_rails'

    app_path = Rails.root.join('sig/app')
    rbs_rails_path = Rails.root.join('sig/rbs_rails')
    subtrahends = Rails.root.glob('sig/*')
                       .reject { |path| path == app_path || path == rbs_rails_path }
                       .map { |path| "--subtrahend=#{path}" }
    sh 'rbs', 'subtract', '--write', 'sig/app', 'sig/rbs_rails', *subtrahends
  end

  task :validate do
    sh 'rbs', '-Isig', 'validate', '--silent'
  end
end

RbsRails::RakeTask.new do |task|
  # If you want to avoid generating RBS for some classes, comment in it.
  # default: nil
  #
  # task.ignore_model_if = -> (klass) { klass == MyClass }

  # If you want to change the rake task namespace, comment in it.
  # default: :rbs_rails
  # task.name = :cool_rbs_rails

  # If you want to change where RBS Rails writes RBSs into, comment in it.
  # default: Rails.root / 'sig/rbs_rails'
  # task.signature_root_dir = Rails.root / 'my_sig/rbs_rails'
end
