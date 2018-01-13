# frozen_string_literal: true

require('spec_helper')

RSpec.describe(Ogel::Git::RemoteBranchesNotOnSystem) do
  let(:git_branches_cmd_response) do
    <<~HDOC
      * develop
        feature/egl/rails50_upgrade
        master
        rails4-controller-specs
        remotes/origin/#151430083-add-rspec-for-new-services
        remotes/origin/HEAD -> origin/master
        remotes/origin/bugfix/use_rollout_for_CM
        remotes/origin/develop
        remotes/origin/feature/egl/rails50_upgrade
        remotes/origin/feature/egl/recaptcha-domain-update
        remotes/origin/feature/yb/disable_report_gen_for_non_quotable_projects
        remotes/origin/master
        remotes/origin/release/1.11.0
    HDOC
  end

  let(:expected_response_list) do
    %w[
      #151430083-add-rspec-for-new-services
      bugfix/use_rollout_for_CM
      feature/egl/recaptcha-domain-update
      feature/yb/disable_report_gen_for_non_quotable_projects
      release/1.11.0
    ]
  end

  before { expect(IO).to receive(:popen).and_return(git_branches_cmd_response) }

  specify { expect(described_class.call).to eq(expected_response_list) }
end
