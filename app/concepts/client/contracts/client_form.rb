class Client
  module Contract
    class ClientForm < ::Reform::Form
      ::Client.attribute_names.each { |col| property col.to_sym }
      validates :full_name, presence: true

      collection :inputs, populator: :populate_inputs do
        (::Input.attribute_names - [:client]).each { |col| property col.to_sym }
        property :_destroy, virtual: true
        validates :name, presence: true
      end

      def prepopulate!(options)
        options[:inputs].each do |input_params|
          self.inputs.insert(0, Input.new(input_params))
        end
      end
      def populate_inputs(fragment:, **)
        return skip! if !fragment[:name] || fragment[:name].empty?
        item = inputs.find { |input| input.id == fragment[:id] && !input.id.nil? }
        return destroy_input(item) if destroy?(fragment, item)
        item ? item : inputs.append(Input.new)
      end

      private

      def destroy_input(item)
        ::Input.destroy(item.id) && inputs.delete(item)
      end

      def destroy?(fragment, item)
        fragment['_destroy'] == '1' && item
      end
    end
  end
end
