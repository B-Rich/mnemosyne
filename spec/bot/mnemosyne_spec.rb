require "spec_helper"

describe Mnemosyne::Bot do
  it "has a version number" do
    expect(Mnemosyne::Bot::VERSION).not_to be nil
  end
end
