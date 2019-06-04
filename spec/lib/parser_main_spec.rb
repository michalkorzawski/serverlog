require 'spec_helper'
require 'parser_main'

RSpec.describe ParserMain do
  let(:server_log) { File.open("#{RSPEC_ROOT}/support/webserver.log") }

  let(:call) { described_class.new(server_log).call }

  let(:formatted_output) do
    <<~END
    list of webpages with most page views:
    /index 8 views
    /help_page/1 6 views
    /home 5 views
    /about/2 4 views
    /contact 4 views
    /about 3 views

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
