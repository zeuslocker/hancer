class Driver
  module Contract
    class DriversForm < ::Reform::Form
      collection :drivers, prepopulator: :drivers_prepopulator,
                           populator: :populate_drivers! do
        property :_destroy, virtual: true
        properties :id, :full_name, :created_at, :updated_at
      end

      def drivers_prepopulator(*)
        drivers.append(::Driver.new)
      end

      def populate_drivers!(fragment:, **)
        item = fragment['id'] && drivers.find_by(id: fragment['id'])
        return drivers(item, fragment) unless destroy?(fragment)
        destroy_driver(item) if item
        skip!
      end

      private

      def destroy?(fragment)
        fragment['_destroy'] == '1'
      end

      def destroy_driver(item)
        ::Driver.destroy(item.id) && drivers.delete(item)
      end
    end
  end
end
