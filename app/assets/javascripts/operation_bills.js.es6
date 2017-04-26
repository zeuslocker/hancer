var OperationBills = {
  collapse: function(event) {
    event.preventDefault();
    event.stopPropagation();
    var table = $(event.target.closest('.content-box__bill')).find('table');
    table.toggleClass('hide');
  }
}
