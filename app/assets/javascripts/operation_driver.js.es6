//=require alerts

var OperationDriver = {
  deleteDriverElement: function (event) {
    event.preventDefault();
    event.stopPropagation();
    OperationDriver._destroyElementSwall(this, OperationDriver._destroyDriverSucessCallback);
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
  _destroyDriverSucessCallback: function (result, element) {
    element.closest('.driver-box__bgtruck').remove(); // eslint-disable-line  no-undef
    parseAlerts(result);
  },
  addInput: function(event){
    var new_driver_html = $.ajax({
        type: 'GET',
        dataType: "text",
        url: $('.js-add-new-driver').attr('href'),
        success: function(result) {
            OperationDriver.successNewDriverFiled(result);
        },
        error: function(result) {
            OperationDriver.successNewDriverFiled(result);
        }
    });
  },
  successNewDriverFiled: function(result) {
      $('.js-driver-start-label').prepend(result);
  }
}
