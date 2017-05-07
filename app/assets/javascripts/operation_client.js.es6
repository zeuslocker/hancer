//require operation_form
var OperationClient = {
    selectWithFileds: function(event, id) {
        var $target = this;
        var client_ids = [];
        $(this.closest('.note')).find('.form-box__select_white-blue-mr, .form-box__select_white-blue-dnormal').each(
            function(index, value) {
                client_ids.push(value.options[value.options.selectedIndex].value);
            });
        $.ajax({
            type: 'POST',
            url: $('.input_client-inputs-field_link').attr('href'),
            dataType: 'text',
            data: {
                driver_id: $($target).closest('.note').find('.driver_id')[0].value,
                truck_id: $($target).closest('.note').find('.truck_id')[0].value,
                client_ids: client_ids,
                date: $('.date-picker')[0].value,
                form_object: $($target.closest('.note')).find('.truck_id')[0].name.substr(0, $($target.closest('.note')).find('.truck_id')[0].name.lastIndexOf('['))
            },
            success: (result) => {
                OperationClient.AddInputValuesuccessCallback(result, $target)
            }
        });
    },
    AddInputValuesuccessCallback: function(result, target) {
        $($(target).closest('.note')).replaceWith(result);
    },
    new_select_data_params: function(target) {
        var client_ids = [];
        $.each($(target.closest('.note')).find('.form-box__select_white-blue'), function(index, val) {
            client_ids[index] = val.options[val.selectedIndex].value;
        });
        var result = {
            form_object: $(target)[0].name.substr(0, $(target)[0].name.indexOf(']') + 1),
            client_ids: client_ids
        };
        return result;
    }
}
