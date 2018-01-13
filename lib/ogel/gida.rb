# frozen_string_literal: true

module Ogel
  class Gida
    extend Forwardable

    attr_accessor(:console, :local_branch_retriever)

    def initialize(console, local_branch_retriever)
      self.console = console
      self.local_branch_retriever = local_branch_retriever
    end

    def self.call(console:, local_branch_retriever:)
      new(console, local_branch_retriever).call
    end

    def call
      selected_branches.each do |branch|
        print_git_delete_cmd_for_branch(branch)
      end
      sleep(2)
      selected_branches.each do |branch|
        git_delete_cmd_for_branch(branch)
      end
    end

    private

    def_delegators(
      :@local_branch_retriever, :current_branch, :branches_not_currently_on
    )

    def_delegators(:@console, :print_cmd, :multi_select_from_list)

    def selected_branches
      @_selected_branches ||= console.multi_select_from_list(
        message: select_message,
        list: branches_not_currently_on,
      )
    end

    def select_message
      "You are on the <#{current_branch}> branch. Delete branches:"
    end

    def print_git_delete_cmd_for_branch(branch)
      print_cmd(git_delete_cmd_array_for_branch(branch).join(' '))
    end

    def git_delete_cmd_array_for_branch(branch)
      %W[git branch -D #{branch}]
    end

    def git_delete_cmd_for_branch(branch)
      Kernel.system(*git_delete_cmd_array_for_branch(branch))
    end
  end
end
