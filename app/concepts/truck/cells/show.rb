class Truck
  class Cell
    class Show < Trailblazer::Cell
      delegate :number_plate, to: :model

      def drivers
        options[:drivers]
      end

      def current_driver
        model.driver
      end

      def drivers_select_options
        drivers.where.not(id: current_driver).inject('') do |acc, driver|
          acc << content_tag(:option, driver.full_name, value: driver.id)
        end
      end

      def destroy_truck
        link_to I18n.t('destroy'), truck_path(model), method: :delete
      end
    end
  end
end
