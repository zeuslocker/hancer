class Note
  module Contract
    class NoteForm < ::Reform::Form
      ::Note.column_names.each{ |col| property col.to_sym }

      collection :client_ids, populator: :populate_input_values

      def populate_input_values(fragment:, **)
        binding.pry
      end
    end
  end
end
