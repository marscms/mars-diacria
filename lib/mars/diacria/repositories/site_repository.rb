module Mars
  module Diacria
    module SiteRepository
      extend BaseRepository
      extend CreateRepositoryMethod
      extend UpdateRepositoryMethod
      extend DeleteRepositoryMethod

      def self.find(id)
        with_entity(Site) do
          adapter.find(id)
        end
      end
    end
  end
end
