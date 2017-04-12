class Client
  module Contract
    class ClientForm < ::Reform::Form
      ::Client.attribute_names.each { |col| property col.to_sym }

      collection :inputs, populator: :populate_inputs! do
        ::Input.attribute_names.each { |col| property col.to_sym }
      end

      private

      def populate_inputs!(fragment:, **)
        binding.pry
        item = inputs.find { |input| input.id == fragment[:id] }
        item ? item : inputs.append(Input.new)
      end
    end
  end
end
