require 'spec_helper'
require 'most_page_views'

RSpec.describe MostPageViews do
  let(:server_log) do
    File.open("#{RSPEC_ROOT}/support/webserver.log").each.with_object([]) { |line, arr| arr << line.split(' ') }
  end

  let(:call) { described_class.new(server_log).call }

  let(:expected_result) do
    {
      "/index"       => 8,
      "/help_page/1" => 6,
      "/home"        => 5,
      "/about/2"     => 4,
      "/contact"     => 4,
      "/about"       => 3
    }
  end

  it { expect(call).to eq expected_result }

  let(:class_to_s) { described_class.new(server_log).to_s }
  let(:formatted_string) do
    "/index 8 visits\n/help_page/1 6 visits\n/home 5 visits\n/about/2 4 visits\n/contact 4 visits\n/about 3 visits"
  end

  it do
    expect(class_to_s).to eq formatted_string
  end
end
