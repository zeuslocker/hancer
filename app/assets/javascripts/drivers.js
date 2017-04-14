//= require operation_driver

$(document).on('click', '.js-delete-driver', OperationDriver.deleteDriverElement);

$(document).on('input', 'form :input', OperationDriver.activateSaveButton);

$(document).on('click', '#js-submit-driver', OperationDriver.submitForm);

$(document).on("click", '#js-add-input', OperationDriver.addInput)
