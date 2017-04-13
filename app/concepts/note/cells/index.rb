class Note
  class Cell
    class Index < Trailblazer::Cell
      def navbar
        concept('note/cell/navbar', params.fetch(:date, Time.current).strftime("%Y-%m-%d"))
      end

      def show_notes
        ''.tap do |result|
          ::Truck.all.each do |truck|
            form_model = model.find_by(truck_id: truck.id) || truck.build_note
            result << concept('note/cell/new', collection: form_model)
          end
        end
      end
    end
  end
end
