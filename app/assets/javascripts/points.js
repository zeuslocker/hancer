//=require operation_point

$(document).on('click', '.js-delete-point', OperationPoint.deletePointElement);

$(document).on('input', 'form :input', OperationPoint.activateSaveButton);

$(document).on('click', '#js-submit-form', OperationPoint.submitForm);

$(document).on("click", '#js-add-input', OperationPoint.addInput);
