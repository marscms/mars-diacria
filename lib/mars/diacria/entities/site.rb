module Mars
  module Diacria
    class Site < Dry::Struct
      attribute :id,            Types::Strict::String
                                  .meta(omittable: true)

      attribute :name,          Types::Strict::String

      attribute :picture_url,   Types::Strict::String

      attribute :handle,        Types::Strict::String

      attribute :created_by_id, Types::Strict::String

      attribute :created_at,    Types::Strict::DateTime
                                  .meta(omittable: true)

      attribute :updated_at,    Types::Strict::DateTime
                                  .meta(omittable: true)
    end
  end
end
