module Mars
  module Diacria
    class Membership < Dry::Struct
      attribute :id,         Types::Strict::String
                               .meta(omittable: true)

      attribute :role,       Types::Strict::String

      attribute :account_id, Types::Strict::String

      attribute :site_id,    Types::Strict::String

      attribute :created_at, Types::Strict::DateTime
                               .meta(omittable: true)

      attribute :updated_at, Types::Strict::DateTime
                               .meta(omittable: true)
    end
  end
end
