module Mars
  module Diacria
    module MembershipRepository
      extend BaseRepository
      extend CreateRepositoryMethod
      extend UpdateRepositoryMethod
      extend DeleteRepositoryMethod

      def self.find(id)
        with_entity(Membership) do
          adapter.find(id)
        end
      end
    end
  end
end
