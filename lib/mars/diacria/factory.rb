module Mars
  module Diacria
    module Factory
      def self.build(entity_class, attributes)
        if attributes.is_a?(Array)
          attributes = merge_multiple_attributes(attributes)
        end

        entity_class.new(attributes)
      end

      def self.merge_multiple_attributes(attributes)
        multiple_attributes = attributes
        attributes = multiple_attributes.shift
        multiple_attributes.each do |attrs|
          attributes = attributes.merge(attrs)
        end
        attributes
      end
    end
  end
end
