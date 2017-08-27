module RubyEventStore
  module RSpec
    module Matchers
      class HaveEvents
        def initialize(expected)
          @expected = expected
        end

        def matches?(subject)
          @expected.eql?(subject)
        end
      end

      def have_events(events)
        HaveEvents.new(events)
      end
    end
  end
end
