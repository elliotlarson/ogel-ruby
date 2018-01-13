# frozen_string_literal: true

require('spec_helper')

RSpec.describe(Ogel::Git::CheckoutRemoteTrackingBranch) do
  include CaptureStdout

  let(:console) { double(:console) }
  let(:branch) { 'foo-branch' }

  before do
    allow(Kernel).to receive(:exec)
    allow(console).to receive(:print_cmd)
  end

  def do_call
    described_class.call(console: console, branch: branch)
  end

  it('executes the expected git command to checkout the tracking branch') do
    expect(Kernel).to receive(:exec)
      .with('git', 'checkout', '-t', "origin/#{branch}")
    do_call
  end

  it('prints the command before executing it') do
    expect(console).to receive(:print_cmd)
    do_call
  end
end
