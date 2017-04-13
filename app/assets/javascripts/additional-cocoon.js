$(function () {
  $('.add-nested_field-cocoon-js').on('cocoon:before-insert', function (event, addedElement) {
    var keyLandingElements = addedElement.find('.nested_field-cocoon-js');

    keyLandingElements.each(function (index, el) {
      var $labelNumber = $('div:visible.cocoon-wrapper-js').length,
        $nameNumber = $('.cocoon-wrapper-js').length,
        elId = $(el).attr('id'),
        elName = $(el).attr('name'),
        increasedId = incereaseNumberInString(elId, $nameNumber - 1),
        increasedName = incereaseNumberInString(elName, $nameNumber - 1),
        increasedText = incereaseNumberInString($(el).text(), $labelNumber);

      if ($(el).hasClass('label')) {
        $(el).text(increasedText);
      } else {
        $(el).attr({ name: increasedName, id: increasedId });
      }
    });
  });

  function incereaseNumberInString(text, count) {
    if (text !== undefined) {
      return text.replace(/(\d+)+/g, count + 1);
    }
  }

  $(document).bind('cocoon:before-remove', function (event, object) {
    var $currentNumber = parseInt(object.find('.label.nested_field-cocoon-js').text()),
      $arrayChangeElements = $('div:visible.cocoon-wrapper-js:gt(' + ($currentNumber - 1) + ')');

    $arrayChangeElements.each(function (index, el) {
      $(el).find('.label.nested_field-cocoon-js').text($currentNumber + index);
    });
  });
});
// use .add-nested_field-cocoon-js class for add button
// use .label.nested_field-cocoon-js for element where want change text number
// use .nested_field-cocoon-js for field collection where change name array count
