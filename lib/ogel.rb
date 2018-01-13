# frozen_string_literal: true

require('ogel/version')
require('ogel/console')
require('ogel/git/checkout_remote_tracking_branch')
require('ogel/git/remote_branches_not_on_system')
require('ogel/gert')
require('ogel/gert_cli')

begin
  require('pry')
rescue(LoadError)
end

module Ogel
end
