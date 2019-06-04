require 'spec_helper'
require 'unique_page_views'

RSpec.describe UniquePageViews do
  let(:server_log) { File.open("#{RSPEC_ROOT}/support/webserver.log") }
  let(:call) { described_class.new(server_log).call }

  let(:expected_result) do
    {
      "/index"       => 6,
      "/home"        => 5,
      "/help_page/1" => 5,
      "/about"       => 3,
      "/about/2"     => 3,
      "/contact"     => 3,
    }
  end

  it { expect(call).to eq expected_result }
end
