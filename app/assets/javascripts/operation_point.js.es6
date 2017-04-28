//=require alerts

var OperationPoint = {
  deletePointElement: function (event) {
    event.preventDefault();
    event.stopPropagation();
    OperationPoint._destroyElementSwall(this, OperationPoint._destroyPointSucessCallback);
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
  },
  _destroyPointSucessCallback: function (result, element) {
    element.closest('.driver-box__bgtruck').remove(); // eslint-disable-line  no-undef
    parseAlerts(result);
  },
  activateSaveButton: function(event){
    $('#js-submit-form').removeClass('disabled');
  },
  submitForm: function(event){
    $('#js-main-point-form').trigger("submit");
  },
  addInput: function(event){
    var new_point_html = $.ajax({
        type: 'GET',
        dataType: "text",
        url: $('.js-add-new-point').attr('href'),
        success: function(result) {
            OperationPoint.successNewPointFiled(result);
        },
        error: function(result) {
            OperationPoint.successNewPointFiled(result);
        }
    });
  },
  successNewPointFiled: function(result) {
      $('.js-point-start-label').prepend(result);
  }
}
