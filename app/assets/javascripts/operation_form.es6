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
  deleteModelsRow: function(event){
    event.preventDefault();
    event.stopPropagation();
    OperationForm._destroyElementSwall(event.target.closest('a'), OperationForm._destroyRowCallback);
  },
  _destroyRowCallback: function (result, element) {
    debugger;
  },
  changeDate: function(event){
    window.location.replace(`http://localhost:3000/input_values?date=${event.target.value}`);
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
    $('.disabled_input').prop('disabled', true);
    $('#js-main-form').trigger("submit");
  },
  deleteModel: function (event) {
    event.preventDefault();
    event.stopPropagation();
    debugger;
    input_values_ids = []
    input_values_ids = $(event.target.closest('.driver-box__bgtruck_withoutborder')).
      find('input[type=hidden]').map(
      function(index, input) {
        return input.value;
      });
    event.target.closest('.driver-box__bgtruck_withoutborder')
    swal({
      title: I18n.t('helpers.links.confirm'),
      type: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#DD6B55',
      confirmButtonText: I18n.t('helpers.links.yes_destroy'),
      text: "You will not be able to recover this record!",
      closeOnConfirm: true
    }, function () {
      $.ajax({
        type: 'DELETE',
        dataType: "json",
        url: event.target.href,
        data: input_values_ids,
        success: (result) => { successCallback(result, $buttonDelete) }
      });
    });
  },
  _destroySucessCallback: function (result, element) {
    element.closest('.driver-box__bgtruck').remove(); // eslint-disable-line  no-undef
    parseAlerts(result);
  },
  _destroyElementSwall: function (button, successCallback) {
    var $buttonDelete = button;

    swal({
      title: I18n.t('helpers.links.confirm'),
      type: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#DD6B55',
      confirmButtonText: I18n.t('helpers.links.yes_destroy'),
      text: "You will not be able to recover this record!",
      closeOnConfirm: true
    }, function () {
      $.ajax({
        type: 'DELETE',
        dataType: "json",
        url: $buttonDelete.href,
        success: (result) => { successCallback(result, $buttonDelete) }
      });
    });
  }
}
