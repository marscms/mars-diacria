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
        ensure_adapter_method_exists(:all)

        with_entity do
          adapter.all
        end
      end

      def find(id)
        ensure_adapter_method_exists(:find)

        with_entity do
          adapter.find(id)
        end
      end

      def create(entity)
        ensure_adapter_method_exists(:create)

        with_entity do
          adapter.create(entity)
        end
      end

      def update(entity)
        ensure_adapter_method_exists(:update)

        with_entity do
          adapter.update(entity)
        end
      end

      def delete(entity)
        ensure_adapter_method_exists(:delete)

        adapter.delete(entity)
        nil
      end

      def ensure_adapter_method_exists(method_name)
        unless adapter.respond_to?(method_name)
          raise AdapterMethodMissing.new(method_name, adapter)
        end
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
