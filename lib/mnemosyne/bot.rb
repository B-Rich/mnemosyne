require "mnemosyne/bot/version"
require "olimpo"

module Mnemosyne
  module Bot
    extend Olimpo
    autoload :Analyze, "mnemosyne/bot/analyze"
  end
end
