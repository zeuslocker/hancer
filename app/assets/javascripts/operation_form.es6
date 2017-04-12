var OperationForm = {
  removeInputField: function(event){
    $(event.target.closest(".driver-box__input-wrapper")).remove();
  },
  addNewInputField: function(event){
    event.preventDefault();
    event.stopPropagation();
    $.ajax({
      type: 'GET',
      dataType: 'text',
      data: OperationForm.InputFieldData(event),
      url: $('.input_field_link')[0].href,
      success: function (result) {
        OperationForm.appendField(result, event.target);
      }
    });
  },
  appendField: function(result, target){
    $(result).insertBefore(target.closest('button'))
  },
  InputFieldData: function(event){
    var result = {
      client_id: $(event.target).closest('button').attr("value")
    };
    return result;
  },
  addInput: function(event){
    var new_input_html = $.ajax({
        type: 'GET',
        dataType: "text",
        url: $('.js-new-input-row').attr('href'),
        success: function(result) {
          $('.js-form-start-label').prepend(result);
        },
        error: function(result) {
          $('.js-form-start-label').prepend(result);
        }
    });
  },
  activateSaveButton: function (event){
    $('#js-submit-form').removeClass('disabled');
  },
  submitForm: function (event){
    $('#js-main-form').trigger("submit");
  }
}
