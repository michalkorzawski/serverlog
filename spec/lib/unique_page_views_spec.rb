require 'spec_helper'
require 'unique_page_views'

RSpec.describe UniquePageViews do
  let(:server_log) do
    File.open("#{RSPEC_ROOT}/support/webserver.log").each.with_object([]) { |line, arr| arr << line.split(' ') }
  end

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

  let(:class_to_s) { described_class.new(server_log).to_s }
  let(:formatted_string) do
    "/index 6 unique views\n/home 5 unique views\n/help_page/1 5 unique views\n/about 3 unique views\n/about/2 3 unique views\n/contact 3 unique views"
  end

  it do
    expect(class_to_s).to eq formatted_string
  end
end
