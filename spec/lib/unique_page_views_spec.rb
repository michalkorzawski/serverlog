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

  let(:formatted_print) { described_class.new(server_log).to_s }
  let(:formatted_output) do
    <<~END
    unique page views:
    /index 6 unique views
    /home 5 unique views
    /help_page/1 5 unique views
    /about 3 unique views
    /about/2 3 unique views
    /contact 3 unique views
    END
  end

  it do
    expect { formatted_print }.to output(formatted_output).to_stdout
  end
end
