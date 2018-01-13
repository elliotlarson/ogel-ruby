# frozen_string_literal: true

require('spec_helper')

Thor::Util.load_thorfile('lib/ogel/gout_cli.rb')

RSpec.describe(Ogel::GoutCli) do
  specify do
    expect(Ogel::Gout).to receive(:call)
    Thor.new.invoke('ogel:gout_cli:call', [])
  end
end
