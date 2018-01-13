# frozen_string_literal: true

require('spec_helper')

RSpec.describe(Ogel::Gout) do
  let(:console) { double(:console) }
  let(:local_branch_retriever) { double(:local_branch_retriever) }

  let(:current_branch) { 'master' }
  let(:checkoutable_branches) { %w[foo-branch bar-branch] }

  specify do
    expect(local_branch_retriever)
      .to receive(:current_branch).and_return(current_branch)
    expect(local_branch_retriever)
      .to receive(:checkoutable_branches).and_return(checkoutable_branches)
    expect(console).to receive(:select_from_list).and_return('foo-branch')
    expect(console).to receive(:print_cmd)
    expect(Kernel).to receive(:exec).with('git', 'checkout', 'foo-branch')

    described_class.call(
      console: console,
      local_branch_retriever: local_branch_retriever,
    )
  end
end
