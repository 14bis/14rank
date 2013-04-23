module Spree14rank
  class Engine < Rails::Engine
    require 'spree/core'
    # isolate_namespace Spree
    engine_name 'spree_14rank'

    config.autoload_paths += %W(#{config.root}/lib)

    def self.activate
      # require 'decorators'
      # Decorators.register! File.expand_path('../../../', __FILE__)

      Dir.glob(File.join(File.dirname(__FILE__), "../../app/**/*_decorator*.rb")) do |c|
        Rails.application.config.cache_classes ? require(c) : load(c)
      end

      Dir.glob(File.join(File.dirname(__FILE__), "../../app/overrides/*.rb")) do |c|
        Rails.application.config.cache_classes ? require(c) : load(c)
      end

      # Spree::Ability.register_ability(Spree::ReviewsAbility)
    end

    config.to_prepare &method(:activate).to_proc

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

  end
end
