
var OperationForm = {
  removeInputField: function(event){
    $(event.target.closest(".driver-box__input-wrapper")).hide();
    var x = $($(event.target.closest(".driver-box__input-wrapper")).find('input')[0]).clone();
    var base_name = x.attr('name').substr(0, x.attr('name').lastIndexOf('[')-1);
    x.attr('name', base_name+"[_destroy]");
    x.attr('value', 1);
    $(event.target.closest(".driver-box__input-wrapper")).append(x);
    OperationForm.activateSaveButton();
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
  deleteNewRow: function(event){
    event.preventDefault();
    event.stopPropagation();
    swal({
      title: I18n.t('helpers.links.confirm'),
      type: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#DD6B55',
      confirmButtonText: I18n.t('helpers.links.yes_destroy'),
      text: "You will not be able to recover this record!",
      closeOnConfirm: true
    }, function () {
      OperationForm._destroyRowCallback({notice: 'Unsaved fields successfully removed!'}, event);
    });
  },
  deleteModelsRow: function(event){
    event.preventDefault();
    event.stopPropagation();
    var input_values_ids = $(event.target.closest('.driver-box__bgtruck_withoutborder')).
      find('input[type=hidden]').filter(OperationForm.isIdInput).map(
      function(index, input) {
        return input.value;
      });
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
        url: event.target.closest('a').href,
        data: {input_values_ids: Array.from(input_values_ids)},
        success: (result) => { OperationForm._destroyRowCallback(result, event) }
      });
    });
  },
  _destroyRowCallback: function (result, event) {
    event.target.closest('.driver-box__bgtruck_withoutborder').remove();
    if(result['notice'] != undefined){
    toastr.success(result['notice']);
    }else{
    toastr.error(result['alert']);
    }
  },
  changeDate: function(event){
    window.location.replace('http://'+window.location.host + '/input_values?date=' + event.target.value);
  },
  changeDateBill: function(event){
    window.location.replace('http://'+window.location.host + '/bills?date=' + event.target.value);
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
    OperationForm._destroyElementSwall(event.target.closest('a'), OperationForm._destroySucessCallback);
  },
  successRowDelete: function (result, event) {
    element.target.closest('row').remove();
  },
  isIdInput: function (index, value) {
    return value.name.endsWith('[id]');
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
