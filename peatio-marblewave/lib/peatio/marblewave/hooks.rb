# frozen_string_literal: true

module Peatio
  module MarbleWave
    module Hooks
      BLOCKCHAIN_VERSION_REQUIREMENT = "~> 1.0.0"
      WALLET_VERSION_REQUIREMENT = "~> 1.0.0"

      class << self
        def check_compatibility
          unless Gem::Requirement.new(BLOCKCHAIN_VERSION_REQUIREMENT)
                                 .satisfied_by?(Gem::Version.new(Peatio::Blockchain::VERSION))
            [
              "MarbleWave blockchain version requiremnt was not suttisfied by Peatio::Blockchain.",
              "MarbleWave blockchain requires #{BLOCKCHAIN_VERSION_REQUIREMENT}.",
              "Peatio::Blockchain version is #{Peatio::Blockchain::VERSION}"
            ].join('\n').tap {|s| Kernel.abort s }
          end

          unless Gem::Requirement.new(WALLET_VERSION_REQUIREMENT)
                                 .satisfied_by?(Gem::Version.new(Peatio::Wallet::VERSION))
            [
              "MarbleWave wallet version requiremnt was not suttisfied by Peatio::Wallet.",
              "MarbleWave wallet requires #{WALLET_VERSION_REQUIREMENT}.",
              "Peatio::Wallet version is #{Peatio::Wallet::VERSION}"
            ].join('\n').tap {|s| Kernel.abort s }
          end
        end

        def register
          Peatio::Blockchain.registry[:marblewave] = MarbleWave::Blockchain
          Peatio::Wallet.registry[:marblewaved] = MarbleWave::Wallet
        end
      end

      if defined?(Rails::Railtie)
        require "peatio/marblewave/railtie"
      else
        check_compatibility
        register
      end
    end
  end
end
