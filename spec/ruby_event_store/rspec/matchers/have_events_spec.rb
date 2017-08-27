require 'spec_helper'
require 'ruby_event_store/event'
require 'ruby_event_store/rspec/matchers/have_events'

class OrderPlaced < RubyEventStore::Event
end

module RubyEventStore
  module RSpec
    module Matchers
      ::RSpec.describe HaveEvents do
        include Matchers

        let(:stream_event1) do
          OrderPlaced.new(event_id: "123-123", data: { order_id: 312 })
        end
        let(:stream_event2) do
          OrderPlaced.new(event_id: "234-234", data: { order_id: 312 })
        end
        let(:non_stream_event) do
          OrderPlaced.new(event_id: "456-456", data: { order_id: 312 })
        end
        subject(:stream) do
          [stream_event1, stream_event2]
        end

        it "matches with exactly the same list of events" do
          expect(stream).to have_events([stream_event1, stream_event2])
        end

        it "doesn't match with exactly the list of one of events" do
          expect(stream).not_to have_events([stream_event1])
        end

        it "matches with list with copies of the original events" do
          expect(stream).to have_events([stream_event1.dup, stream_event2.dup])
        end

        it "doesn't match with list of different order of events" do
          expect(stream).not_to have_events([stream_event2, stream_event1])
        end

        it "doesn't match with list of different events" do
          expect(stream).not_to have_events([non_stream_event])
        end

        it "doesn't match with list of stream event and other different events" do
          expect(stream).not_to have_events([stream_event1, stream_event2, non_stream_event])
        end
      end
    end
  end
end
