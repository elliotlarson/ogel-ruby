# frozen_string_literal: true

require('spec_helper')

RSpec.describe(Ogel::Gida) do
  let(:console) { double(:console) }
  let(:local_branch_retriever) { double(:local_branch_retriever) }

  let(:current_branch) { 'master' }
  let(:branches_not_currently_on) { %w[foo-branch bar-branch] }

  specify do
    expect(local_branch_retriever)
      .to receive(:current_branch).and_return(current_branch)
    expect(local_branch_retriever)
      .to receive(:branches_not_currently_on)
      .and_return(branches_not_currently_on)
    expect(console).to receive(:multi_select_from_list)
      .and_return(['foo-branch'])
    expect(console).to receive(:print_cmd)
    expect(Kernel).to receive(:system).with('git', 'branch', '-D', 'foo-branch')

    described_class.call(
      console: console,
      local_branch_retriever: local_branch_retriever,
    )
  end
end
