# frozen_string_literal: true

module CaptureStdout
  def capture_stdout
    $stdout = StringIO.new
    yield
    $stdout.string
  ensure
    $stdout = STDOUT
  end
end
