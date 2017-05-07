require_relative '../../truck/contracts/truck_form.rb'
class InputValue
  module Contract
    class InputValueForm < ::Reform::Form
      #properties truck_id, driver_id, form: ::Truck::Contract::TruckForm
      ::InputValue.attribute_names.each { |col| property col.to_sym }
    end
  end
end
