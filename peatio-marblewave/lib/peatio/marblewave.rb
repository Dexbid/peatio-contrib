# frozen_string_literal: true

require "active_support/core_ext/object/blank"
require "active_support/core_ext/enumerable"
require "peatio"

module Peatio
  module MarbleWave
    require "bigdecimal"
    require "bigdecimal/util"

    require "peatio/marblewave/blockchain"
    require "peatio/marblewave/client"
    require "peatio/marblewave/wallet"

    require "peatio/marblewave/hooks"

    require "peatio/marblewave/version"
  end
end
