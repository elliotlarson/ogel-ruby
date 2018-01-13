# frozen_string_literal: true

module Ogel
  # Select a branch to checkout from a list of local branches
  class Gout
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
      print_git_checkout_command
      git_checkout_selected_branch
    end

    private

    def_delegators(
      :@local_branch_retriever, :current_branch, :branches_not_currently_on
    )

    def_delegators(:@console, :print_cmd, :select_from_list)

    def print_git_checkout_command
      print_cmd(git_checkout_cmd_array.join(' '))
    end

    def git_checkout_cmd_array
      %W[git checkout #{selected_branch}]
    end

    def selected_branch
      @_selected_branch ||= console.select_from_list(
        message: select_message,
        list: branches_not_currently_on,
      )
    end

    def select_message
      "You are on the <#{current_branch}> branch. Checkout branch:"
    end

    def git_checkout_selected_branch
      Kernel.exec(*git_checkout_cmd_array)
    end
  end
end
