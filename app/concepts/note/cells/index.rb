class Note
  class Cell
    class Index < Trailblazer::Cell
      def navbar
        concept('note/cell/navbar', params.fetch(:date, Time.current).strftime('%Y-%m-%d'))
      end

      def show_notes
        ''.tap do |result|
          ::Truck.all.order(created_at: :desc).each_with_index do |truck, index|
            form_model = model['notes'].find_by(truck_id: truck.id) || truck.notes.new
            result << concept('note/cell/new', form_model, index: index).show
          end
        end
      end
    end
  end
end
