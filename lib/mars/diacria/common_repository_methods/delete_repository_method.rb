module Mars
  module Diacria
    module DeleteRepositoryMethod
      def delete(entity)
        adapter.delete(entity)
        nil
      end
    end
  end
end
