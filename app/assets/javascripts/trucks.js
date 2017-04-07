//=require operation_truck

  $(document).on('click', '.js-delete-truck', OperationTruck.deleteTruckElement);

  $(document).on('change', 'form :input', OperationTruck.activateSaveButton);

  $(document).on('click', '#js-submit-truck', OperationTruck.submitForm);

  $(document).on("click", '#js-add-input', OperationTruck.addInput);

  $(document).on("click", '#js-clean-field', OperationTruck.cleanField);
