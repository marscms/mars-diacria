module Mars
  module Diacria
    module BaseRepository
      def adapter
        @adapter
      end

      def adapter=(adapter)
        @adapter = adapter
      end

      def with_entity(entity, &block)
        result = block.call

        if result.is_a?(Array)
          result.map { |r| Factory.build(entity, r) }
        else
          Factory.build(entity, result)
        end
      end
    end
  end
end
