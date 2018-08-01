module Mars
  module Diacria
    module UpdateRepositoryMethod
      def update(entity)
        with_entity(entity.class) do
          adapter.update(entity)
        end
      end
    end
  end
end
