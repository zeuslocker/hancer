var OperationClient = {
    selectWithFileds: function(event) {
        var $target = event.target;
        var client_ids = [];
        $(event.target.closest('.note')).find('.form-box__select_white-blue-mr').each(
          function (index, value){
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
      /*  var input_fields = $(target.closest('.row')).find('.col-sm-1'); // check if fields exist
        if (input_fields.length > 0) { //if exist add new field and remove old
          input_fields.remove();
          $(target.closest('.col-sm-3')).after(result);
          return;
        }
        $.ajax({
            type: 'POST',
            url: $('.new-client-select-link').attr('href'),
            data: OperationClient.new_select_data_params(target),
            dataType: 'text',
            success: (result) => {
                $(target.closest('.driver-box__bgtruck_withoutborder')).after(result);
            }
        });
        $(target.closest('.col-sm-3')).after(result); */
    },
    new_select_data_params: function(target){
      var client_ids = [];
      $.each($(target.closest('.note')).find('.form-box__select_white-blue'), function(index, val){
        client_ids[index] = val.options[val.selectedIndex].value;
      });
      var result = {
        form_object: $(target)[0].name.substr(0, $(target)[0].name.indexOf(']') + 1),
        client_ids: client_ids
      };
      return result;
    }
}
