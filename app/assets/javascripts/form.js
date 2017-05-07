//= require operation_form

$(function () {
  $(document).on('click', '.plus-btn', OperationForm.addNewInputField);

  $(document).on('click', '.destroy-field__image', OperationForm.removeInputField);

  $(document).on('click', '#js-add-input', OperationForm.addInput);

  $(document).on('input', 'form :input', OperationForm.activateSaveButton);

  $(document).on('change', '.checkbox-circle > *', OperationForm.activateSaveButton);

  $(document).on('click', '#js-submit-form', OperationForm.submitForm);

  $(document).on('click', '.js-delete-model', OperationForm.deleteModel);

  $(document).on('change', '.date-picker', OperationForm.changeDate);

  $(document).on('click', '.js-delete-model-row', OperationForm.deleteModelsRow);

  $(document).on('click', '.js-delete-new-row', OperationForm.deleteNewRow);

  $(document).on('change', '.date-picker-bill', OperationForm.changeDateBill);

});
$(document).on('click', '.back__img', OperationForm.backLink);
