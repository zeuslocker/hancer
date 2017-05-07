class Driver
  module Contract
    class DriverForm < ::Reform::Form
      ::Driver.attribute_names.each { |col| property col.to_sym }

      validates :full_name, presence: true
    end
  end
end
