require 'spec_helper'

describe Sabnzbd::Client do
  let(:sabnzbd) { Sabnzbd::Client.new(server: 'http://example.com/', api_key: '2d31ab68791897ddd704c85ad4c3c3f6') }

  describe "#simple_queue" do
    it "should request limited details on the current queue and state of sabnzbd" do
      stub_request(:get, 'http://example.com/api?apikey=2d31ab68791897ddd704c85ad4c3c3f6&mode=qstatus&output=json').
        to_return(:status => 200, :body => load_fixture('simple_queue'))
        response = sabnzbd.simple_queue
    end
  end
end
