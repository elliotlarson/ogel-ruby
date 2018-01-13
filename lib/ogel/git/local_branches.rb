# frozen_string_literal: true

module Ogel
  module Git
    class LocalBranches
      CURRENT_BRANCH_REGEX = /^\*\s/

      attr_accessor(:current_branch, :branches_not_currently_on)

      def initialize
        self.branches_not_currently_on = []
        git_branches_output.lines.each { |line| process_line(line) }
      end

      private

      def git_branches_output
        @_git_branches_output ||= IO.popen(%w[git branch], &:read)
      end

      def process_line(line)
        line.strip!
        if line =~ CURRENT_BRANCH_REGEX
          self.current_branch = line.gsub(CURRENT_BRANCH_REGEX, '')
        else
          branches_not_currently_on << line
        end
      end
    end
  end
end
