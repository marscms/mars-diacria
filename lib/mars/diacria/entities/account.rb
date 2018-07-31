module Mars
  module Diacria
    class Account < Dry::Struct
      attribute :id,          Types::Strict::String
                                .meta(omittable: true)

      attribute :name,        Types::Strict::String

      attribute :super_admin, Types::Strict::Bool
                                .default(false)

      attribute :created_at,  Types::Strict::DateTime
                                .meta(omittable: true)

      attribute :updated_at,  Types::Strict::DateTime
                                .meta(omittable: true)
    end
  end
end
