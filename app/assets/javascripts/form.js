//= require operation_form

$(function () {
  $(document).on('click', '.plus-btn', function(event) {OperationForm.addNewInputField(event)});

  $(document).on('click', '.destroy-field__image', function(event) {OperationForm.removeInputField(event)});

  $(document).on("click", '#js-add-input', function(event) {OperationForm.addInput(event)});

  $(document).on('change', 'form :input', function(event) {OperationForm.activateSaveButton(event)});

  $(document).on('click', '#js-submit-form', function(event) {OperationForm.submitForm(event)});
});
