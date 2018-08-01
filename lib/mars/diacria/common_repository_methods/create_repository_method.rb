module Mars
  module Diacria
    module CreateRepositoryMethod
      def create(entity)
        with_entity(entity.class) do
          adapter.create(entity)
        end
      end
    end
  end
end
