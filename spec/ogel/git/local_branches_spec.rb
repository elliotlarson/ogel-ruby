# frozen_string_literal: true

require('spec_helper')

RSpec.describe(Ogel::Git::LocalBranches) do
  let(:local_branches_git_command_output) do
    <<~HDOC
        develop
        feature/egl/more-rails514-updates
        feature/egl/rails50_upgrade
      * master
        rails4-controller-specs
        release/1.12.0
    HDOC
  end

  let(:instance) { described_class.new }

  before do
    expect(IO).to receive(:popen).and_return(local_branches_git_command_output)
  end

  describe('#current_branch') do
    subject { instance.current_branch }

    it { is_expected.to eq('master') }
  end

  describe('#branches_not_currently_on') do
    subject { instance.branches_not_currently_on }

    let(:expected_branches) do
      %w[
        develop
        feature/egl/more-rails514-updates
        feature/egl/rails50_upgrade
        rails4-controller-specs
        release/1.12.0
      ]
    end

    it { is_expected.to eq(expected_branches) }
  end
end
