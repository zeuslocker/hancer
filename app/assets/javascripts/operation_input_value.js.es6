var OperationInputValue = {
    deleteNewRowAndSelectWithFileds: function(event) {
        event.preventDefault();
        event.stopPropagation();
        var $target = this;
        swal({
            title: I18n.t('helpers.links.confirm'),
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#DD6B55',
            confirmButtonText: I18n.t('helpers.links.yes_destroy'),
            text: "You will not be able to recover unsaved fields!",
            closeOnConfirm: true
        }, function() {
          var client_ids = [];
          var note = $target.closest('.note');
          var driver_id = $($target).closest('.note').find('.driver_id')[0].value;
          var truck_id = $($target).closest('.note').find('.truck_id')[0].value;
          var form_object = $($target.closest('.note')).find('.truck_id')[0].name.substr(0, $($target.closest('.note')).find('.truck_id')[0].name.lastIndexOf('['));
          var href = $($target).attr('date');
          OperationInputValue._removeAndNotificate({notice: 'Unsaved records was successfully removed!'}, $(`.form-box__select_white-blue-dnormal option:selected[value=${href}]`).closest(':input'));
          $(note).find('.form-box__select_white-blue-mr, .form-box__select_white-blue-dnormal').each(
              function(index, value) {
                  if (value.options[value.options.selectedIndex].value != '') {
                      client_ids.push(value.options[value.options.selectedIndex].value);
                  }
              });
          OperationInputValue._replaceNoteBlock(note, driver_id, truck_id, client_ids, $('.date-picker')[0].value, form_object);
        });
    },
    deleteRowAndSelectWithFileds: function(event) {
        event.preventDefault();
        event.stopPropagation();
        var $target = this;
        swal({
            title: I18n.t('helpers.links.confirm'),
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#DD6B55',
            confirmButtonText: I18n.t('helpers.links.yes_destroy'),
            text: "You will not be able to recover this record!",
            closeOnConfirm: true
        }, function() {

            var client_ids = [];
            var note = $target.closest('.note');
            var driver_id = $($target).closest('.note').find('.driver_id')[0].value;
            var truck_id = $($target).closest('.note').find('.truck_id')[0].value;
            var form_object = $($target.closest('.note')).find('.truck_id')[0].name.substr(0, $($target.closest('.note')).find('.truck_id')[0].name.lastIndexOf('['));
            var href = $($target).attr('date');
            OperationInputValue._removeModelsAndNotificate({notice: 'Records was successfully removed!'}, $target);
            $(note).find('.form-box__select_white-blue-mr, .form-box__select_white-blue-dnormal').each(
                function(index, value) {
                    if (value.options[value.options.selectedIndex].value != '') {
                        client_ids.push(value.options[value.options.selectedIndex].value);
                    }
                });
            OperationInputValue._replaceNoteBlock(note, driver_id, truck_id, client_ids, $('.date-picker')[0].value, form_object);
        });
    },
    newClientFields: function(event){
      event.preventDefault();
      event.stopPropagation();
        var $target = event.target;
        var client_ids = [];
        var note = event.target.closest('.note');
        var driver_id = $($target).closest('.note').find('.driver_id')[0].value;
        var truck_id = $($target).closest('.note').find('.truck_id')[0].value;
        var form_object = $($target.closest('.note')).find('.truck_id')[0].name.substr(0, $($target.closest('.note')).find('.truck_id')[0].name.lastIndexOf('['));
        $(note).find('.form-box__select_white-blue-mr, .form-box__select_white-blue-dnormal').each(
            function(index, value) {
                if (value.options[value.options.selectedIndex].value != '') {
                    client_ids.push(value.options[value.options.selectedIndex].value);
                }
            });
        OperationInputValue._replaceNoteBlock(note, driver_id, truck_id, client_ids, $('.date-picker')[0].value, form_object);
    },
    newClientFieldsWithAlert: function(event){
      event.preventDefault();
      event.stopPropagation();
      var $target = event.target;
      swal({
          title: I18n.t('helpers.links.confirm'),
          type: 'warning',
          showCancelButton: true,
          confirmButtonColor: '#DD6B55',
          confirmButtonText: I18n.t('helpers.links.yes_destroy'),
          text: "You will not be able to recover this records!",
          closeOnConfirm: true
      }, function() {
        var client_ids = [];
        var note = $target.closest('.note');
        var driver_id = $($target).closest('.note').find('.driver_id')[0].value;
        var truck_id = $($target).closest('.note').find('.truck_id')[0].value;
        var form_object = $($target.closest('.note')).find('.truck_id')[0].name.substr(0, $($target.closest('.note')).find('.truck_id')[0].name.lastIndexOf('['));
        var href = $($target).attr('date');
        var input_values_ids = OperationInputValue.input_values_ids($target);
        $.ajax({
            type: 'DELETE',
            dataType: "json",
            url: Routes.destroy_collection_input_values_path,
            data: {
                input_values_ids: Array.from(input_values_ids)
            }
        });

        $(note).find('.form-box__select_white-blue-mr, .form-box__select_white-blue-dnormal').each(
            function(index, value) {
                if (value.options[value.options.selectedIndex].value != '') {
                    client_ids.push(value.options[value.options.selectedIndex].value);
                }
            });
        OperationInputValue._replaceNoteBlock(note, driver_id, truck_id, client_ids, $('.date-picker')[0].value, form_object);
      });
    },
    _replaceNoteBlock(object, driver_id, truck_id, client_ids, date, form_object) {
        $.ajax({
            type: 'POST',
            url: $('.input_client-inputs-field_link').attr('href'),
            dataType: 'text',
            data: {
                driver_id: driver_id,
                truck_id: truck_id,
                client_ids: client_ids,
                date: date,
                form_object: form_object
            },
            success: (result) => {
                $(object).replaceWith(result);
            }
        });
    },
    input_values_ids: function(target) {
        return $(target.closest('.note')).find('input[type=hidden]').filter(function (index, value){
          return $(value).attr('date') == $(target).attr('date') || $(value).attr('date') == $(target).attr('current_val');;
        }).map(
            function(index, input) {
                return input.value;
            });
    },
    _removeModelsAndNotificate: function(notification, $target) {
        var input_values_ids = OperationInputValue.input_values_ids($target);
        $.ajax({
            type: 'DELETE',
            dataType: "json",
            url: Routes.destroy_collection_input_values_path,
            data: {
                input_values_ids: Array.from(input_values_ids)
            }
        });
        OperationInputValue.removeSelectField($target);
        if (notification['notice'] != undefined) {
            toastr.success(notification['notice']);
        } else {
            toastr.error(notification['alert']);
        }
        return input_values_ids;
    },
    removeSelectField($target){
      $(`.form-box__select_white-blue-dnormal option:selected[value= ${$($target).attr('date')}]`).closest('.form-box__select_white-blue-dnormal').remove();
    },
    _removeAndNotificate(notification, target) {
        target.remove();
        if (notification['notice'] != undefined) {
            toastr.success(notification['notice']);
        } else {
            toastr.error(notification['alert']);
        }
    }
}
