class Admin
  module Contract
    class AdminForm < ::Reform::Form
      collection :trucks, populator: :populate_trucks do
        def prepopulate!(options)
          binding.pry
          self.input_values
        end
        ::Truck.attribute_names.each { |col| property col.to_sym }
        validates :id, :driver_id, presence: true

        collection :input_values, populator: :populate_input_values do
          properties :value, :input_id
          validates :value, :input_id, presence: true
        end

        def populate_input_values(fragment:, **)
          return skip! if !fragment[:value] || fragment[:value].empty?
          item = fragment[:id] && input_values.find_by(id: fragment[:id])
          input_values.append(item || InputValue.new)
        end
      end

      def populate_trucks(fragment:, **)
        trucks.find_by(id: fragment[:id])
      end
    end
  end
end
