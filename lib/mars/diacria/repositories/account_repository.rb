module Mars
  module Diacria
    module AccountRepository
      extend BaseRepository
      extend CreateRepositoryMethod
      extend UpdateRepositoryMethod
      extend DeleteRepositoryMethod

      def self.find(id)
        with_entity(Account) do
          adapter.find(id)
        end
      end
    end
  end
end
