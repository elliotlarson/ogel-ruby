# frozen_string_literal: true

module Ogel
  Gert = Struct.new(:console) do
    def self.call(console:)
      new(console).call
    end

    def call
      checkout_remote_tracking_branch
    end

    private

    def checkout_remote_tracking_branch
      Git::CheckoutRemoteTrackingBranch.call(
        console: console,
        branch: selected_remote_branch,
      )
    end

    def selected_remote_branch
      @_selected_remote_branch ||= console.select_from_list(
        message: 'Checkout a remote tracking branch:',
        list: remote_branches_select_options,
      )
    end

    def remote_branches_select_options
      remote_branches_not_on_system
    end

    def remote_branches_not_on_system
      Git::RemoteBranchesNotOnSystem.call
    end
  end
end
