//=require alerts

var OperationTruck = {
    deleteTruckElement: function(event) {
        event.preventDefault();
        event.stopPropagation();
        OperationTruck._destroyElementSwall(this, OperationTruck._destroyTruckSucessCallback);
    },
    _destroyElementSwall: function(button, successCallback) {
        var $buttonDelete = button;

        swal({
            title: I18n.t('helpers.links.confirm'),
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#DD6B55',
            confirmButtonText: I18n.t('helpers.links.yes_destroy'),
            text: "You will not be able to recover this record!",
            closeOnConfirm: true
        }, function() {
            $.ajax({
                type: 'DELETE',
                dataType: "json",
                url: $buttonDelete.href,
                success: (result) => {
                    successCallback(result, $buttonDelete)
                }
            });
        });
    },
    _destroyTruckSucessCallback: function(result, element) {
        element.closest('.driver-box__bgtruck').remove(); // eslint-disable-line  no-undef
        parseAlerts(result);
    },
    activateSaveButton: (event) => {
        $('#js-submit-form').removeClass('disabled');
    },
    submitForm: function(event) {
        $('#js-main-truck-form').trigger("submit");
    },
    addInput: function(event) {
        var new_truck_html = $.ajax({
            type: 'GET',
            dataType: "text",
            url: $('.js-add-new-truck').attr('href'),
            success: function(result) {
                $('.js-truck-start-label').prepend(result);
            },
            error: function(result) {
                $('.js-truck-start-label').prepend(result);
            }
        });
    },
    successNewTruckFiled: function(result) {
        $('.js-truck-start-label').prepend(result);
    },
    cleanField: function(event) {
        event.preventDefault();
        event.stopPropagation();
        $('#js-clean-field').closest(':text').attr('value', '');
    }
}
