# frozen_string_literal: true

require('spec_helper')

Thor::Util.load_thorfile('lib/ogel/gida_cli.rb')

RSpec.describe(Ogel::GidaCli) do
  specify do
    expect(Ogel::Gida).to receive(:call)
    Thor.new.invoke('ogel:gida_cli:call', [])
  end
end
