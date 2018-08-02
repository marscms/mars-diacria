module Mars
  module Diacria
    class AdapterMethodMissing < StandardError
      def initialize(missing_method, adapter)
        super("undefined method '#{missing_method}' for #{adapter.inspect} adapter")
      end
    end
  end
end
