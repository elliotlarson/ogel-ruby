# frozen_string_literal: true

require('thor')

module Ogel
  class GidaCli < Thor
    default_task(:call)

    desc(:call, 'Remove multiple local branches')

    def call
      Gida.call(
        console: Ogel::Console.new,
        local_branch_retriever: Ogel::Git::LocalBranches.new,
      )
    end
  end
end
