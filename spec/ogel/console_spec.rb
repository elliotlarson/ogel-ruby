# frozen_string_literal: true

require('spec_helper')

RSpec.describe(Ogel::Console) do
  include CaptureStdout

  let(:console) { described_class.new }

  describe('#print_bye') do
    subject { capture_stdout { console.print_bye } }

    it { is_expected.to eq("\e[32mbye\e[0m\n") }
  end

  describe('#print_cmd') do
    subject { capture_stdout { console.print_cmd('git status') } }

    it { is_expected.to eq("\e[36m$ git status\e[0m\n") }
  end
end
