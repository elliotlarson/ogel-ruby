# frozen_string_literal: true

require('thor')

module Ogel
  class GoutCli < Thor
    default_task(:call)

    desc(:call, 'List the local branches and pick one to checkout')

    def call
      Gout.call(
        console: Ogel::Console.new,
        local_branch_retriever: Ogel::Git::LocalBranches.new,
      )
    end
  end
end
