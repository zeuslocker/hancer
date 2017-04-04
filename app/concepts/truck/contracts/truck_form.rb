class Truck
  module Contract
    class TruckForm < ::Reform::Form
      ::Truck.attribute_names.each { |col| property col.to_sym }
      validates :number_plate, :driver_id, presence: true
    end
  end
end
