# frozen_string_literal: true

module Ogel
  module Git
    CheckoutRemoteTrackingBranch = Struct.new(:console, :branch) do
      def self.call(console:, branch:)
        new(console, branch).call
      end

      def call
        print_out_full_git_checkout_cmd
        sleep 1
        execute_git_checkout_cmd
      end

      private

      def print_out_full_git_checkout_cmd
        console.print_cmd(git_tracking_branch_checkout_cmd_array.join(' '))
      end

      def git_tracking_branch_checkout_cmd_array
        ['git', 'checkout', '-t', "origin/#{branch}"]
      end

      def execute_git_checkout_cmd
        Kernel.exec(*git_tracking_branch_checkout_cmd_array)
      end
    end
  end
end
