module Mars
  module Diacria
    module BaseRepository
      def adapter
        @adapter
      end

      def adapter=(adapter)
        @adapter = adapter
      end

      def entity(entity_class)
        @entity_class = entity_class
      end

      def all
        with_entity do
          adapter.all
        end
      end

      def find(id)
        with_entity do
          adapter.find(id)
        end
      end

      def create(entity)
        with_entity do
          adapter.create(entity)
        end
      end

      def update(entity)
        with_entity do
          adapter.update(entity)
        end
      end

      def delete(entity)
        adapter.delete(entity)
        nil
      end

      def with_entity(&block)
        result = block.call

        if result.is_a?(Array)
          result.map { |r| Factory.build(@entity_class, r) }
        else
          Factory.build(@entity_class, result)
        end
      end
    end
  end
end
