var OperationClient = {
  selectWithFileds: function (event) {
    debugger;
    var $target = event.target;
    $.ajax({
      type: 'GET',
      url: $('.input_client-inputs-field_link').attr('href'),
      dataType: 'text',
      data: {id: event.target.options[event.target.selectedIndex].value,
             form_object: $($target)[0].name.substr(0, $($target)[0].name.lastIndexOf('[')),
             note_id: $($target).closest('tr').find('input:hidden')[0].value},
      success: (result) => { OperationClient.AddInputValuesuccessCallback(result, $target) }
    });
  },
  AddInputValuesuccessCallback: function(result, target){
    debugger;
    $(target).after(result);
    var new_select = $(target).find(`option[value='${target.options[target.selectedIndex].value}']`)[0].remove();
    target.closest('tr').after($(target)[0]);
  }
}
