# frozen_string_literal: true

module Ogel
  module Git
    class LocalBranches
      CURRENT_BRANCH_REGEX = /^\*\s/

      attr_accessor(:current_branch, :checkoutable_branches)

      def initialize
        self.checkoutable_branches = []
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
          checkoutable_branches << line
        end
      end
    end
  end
end
