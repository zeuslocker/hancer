// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require turbolinks
//= require_tree .
//= require sweet-alert
//= require sweet-alert-confirm
//= require i18n.js
//= require i18n/translations

$(function() {
    $(document).on('click', '#js-submit-driver', function(event) {
        $('#js-main-driver-form').trigger("submit");
    });

    $(document).on("click", '#js-add-input', function(event) {
        var new_driver_html = $.ajax({
            type: 'GET',
            dataType: "text",
            url: $('.js-add-new-driver').attr('href'),
            success: function(result) {
                successNewDriverFiled(result);
            },
            error: function(result) {
                successNewDriverFiled(result);
            }
        });
    });

    function successNewDriverFiled(result) {
        debugger;
        $('.js-driver-start-label').prepend(result);
    }
});
