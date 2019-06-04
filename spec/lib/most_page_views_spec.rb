require 'spec_helper'
require 'most_page_views'

RSpec.describe MostPageViews do
  let(:server_log) { File.open("#{RSPEC_ROOT}/support/webserver.log") }
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

  let(:formatted_print) { described_class.new(server_log).to_s }
  let(:formatted_output) do
    <<~END
    list of webpages with most page views:
    /index 8 views
    /help_page/1 6 views
    /home 5 views
    /about/2 4 views
    /contact 4 views
    /about 3 views
    END
  end

  it do
    expect { formatted_print }.to output(formatted_output).to_stdout
  end
end
