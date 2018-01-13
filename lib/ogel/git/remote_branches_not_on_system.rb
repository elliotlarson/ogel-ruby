# frozen_string_literal: true

module Ogel
  module Git
    # Retrieve a list of remote branches that are not on the current machine
    class RemoteBranchesNotOnSystem
      GIT_CMD = %w[git branch -a].freeze

      def self.call
        new.call
      end

      def call
        remote_branches_not_on_system
      end

      private

      def remote_branches_not_on_system
        remote_branches.map { |l| l.gsub(%r{^remotes/origin/}, '') }
                       .delete_if { |l| local_branches.include?(l) }
      end

      def remote_branches
        all_branches.select { |l| l =~ %r{^remotes/origin} }
                    .delete_if { |l| l.include?('HEAD ->') }
      end

      def all_branches
        @_all_branches ||= git_branches_output.lines.map(&:strip).map do |l|
          l.gsub(/^\* /, '')
        end
      end

      def git_branches_output
        IO.popen(GIT_CMD, &:read)
      end

      def local_branches
        @_local_branches ||= all_branches.delete_if { |l| l =~ /^remotes/ }
      end
    end
  end
end
