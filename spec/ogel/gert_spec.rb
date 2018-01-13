# frozen_string_literal: true

require('spec_helper')

RSpec.describe(Ogel::Gert) do
  let(:console) { double(:console) }

  def do_call
    described_class.call(console: console)
  end

  before do
    allow(Ogel::Git::RemoteBranchesNotOnSystem).to receive(:call).and_return([])
    allow(console).to receive(:print_bye)
    expect(console).to receive(:select_from_list).and_return(branch_selection)
  end

  let(:branch_selection) { 'foo' }

  specify do
    expect(Ogel::Git::CheckoutRemoteTrackingBranch).to receive(:call)
    do_call
  end
end
