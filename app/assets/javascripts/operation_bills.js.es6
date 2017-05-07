var OperationBills = {
    collapse: function(event) {
        event.preventDefault();
        event.stopPropagation();
        var table = $(this.closest('.content-box__bill')).find('table');
        table.toggleClass('hide');
    }
}
