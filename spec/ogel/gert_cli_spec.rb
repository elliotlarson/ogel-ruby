# frozen_string_literal: true

require('spec_helper')

Thor::Util.load_thorfile('lib/ogel/gert_cli.rb')

RSpec.describe(Ogel::GertCli) do
  specify do
    expect(Ogel::Gert).to receive(:call)
    Thor.new.invoke('ogel:gert_cli:call', [])
  end
end
