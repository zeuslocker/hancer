var OperationClient = {
    selectWithFileds: function(event) {
        var $target = event.target;
        $.ajax({
            type: 'GET',
            url: $('.input_client-inputs-field_link').attr('href'),
            dataType: 'text',
            async: false,
            data: {
                id: event.target.options[event.target.selectedIndex].value,
                form_object: $($target)[0].name.substr(0, $($target)[0].name.lastIndexOf('[')),
                note_id: $($target).closest('.note').find('input:hidden')[0].value
            },
            success: (result) => {
                OperationClient.AddInputValuesuccessCallback(result, $target)
            }
        });
    },
    AddInputValuesuccessCallback: function(result, target) {
        var input_fields = $(target.closest('.row')).find('.col-sm-1'); // check if fields exist
        if (input_fields.length > 0) { //if exist add new field and remove old
          input_fields.remove();
          $(target.closest('.col-sm-3')).after(result);
          return;
        }
        $.ajax({
            type: 'GET',
            url: $('.new-client-select-link').attr('href'),
            data: OperationClient.new_select_data_params(target),
            async: false,
            dataType: 'text',
            success: (result) => {
                $(target.closest('.driver-box__bgtruck_withoutborder')).after(result);
            }
        });
        $(target.closest('.col-sm-3')).after(result);
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
