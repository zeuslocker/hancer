class Client
  module Contract
    class ClientForm < ::Reform::Form
      ::Client.attribute_names.each { |col| property col.to_sym }
      validates :full_name, presence: true

      collection :inputs, populator: :populate_inputs do
        (::Input.attribute_names - [:client]).each { |col| property col.to_sym }
        validates :name, presence: true
      end

      def prepopulate!(options)
        options[:inputs].each do |input_params|
          self.inputs.append(Input.new(input_params))
        end
      end

      def populate_inputs(fragment:, **)
        item = inputs.find { |input| input.id == fragment[:id] && !input.id.nil? }
        item ? item : inputs.append(Input.new)
      end
    end
  end
end
