require 'spec_helper'
require 'parser_main'

RSpec.describe ParserMain do
  let(:server_log) { File.open("#{RSPEC_ROOT}/support/webserver.log") }

  let(:call) { described_class.new(server_log).call }

  let(:formatted_output) do
    <<~END
    list of webpages with most page views:
    /index 8 visits
    /help_page/1 6 visits
    /home 5 visits
    /about/2 4 visits
    /contact 4 visits
    /about 3 visits

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
    expect { call }.to output(formatted_output).to_stdout
  end
end
