class Driver
  class Cell
    class Index < Trailblazer::Cell
      def show_drivers
        concept('driver/cell/show', collection: model)
      end

      def flash_messages
        flash = parent_controller.flash
        if !flash.empty?
          flash.keys.inject("") do |acc, elem|
            acc << content_tag(:div, "#{flash[elem.to_sym]}", class: "#{elem}")
          end
        end
      end
    end
  end
end
