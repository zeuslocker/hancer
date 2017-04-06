//= require operation_driver
$(function () {
  $(document).on('click', '.js-delete-driver', OperationDriver.deleteDriverElement);

  $(document).on('change', 'form :input', OperationDriver.activateSaveButton);
});
