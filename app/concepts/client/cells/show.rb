class Client
  class Cell
    class Show < Trailblazer::Cell
      include TrailblazerHelpers::Cells::UniqKey
      delegate :inputs, to: :model

      def client_inputs
        concept('client/cell/new_input', collection: model.inputs)
      end

      def destroy
        link_to(image_tag('delete_row'), client_path(model), class: 'js-delete-model')
      end
    end
  end
end
