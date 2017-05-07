//= require operation_client
//= require operation_input_value
$(document).on('change', '.js-render-client-fields', OperationClient.selectWithFileds);

$(document).on('click', '.js-delete-new-row-inlut-value', OperationInputValue.deleteNewRowAndSelectWithFileds);

$(document).on('click', '.js-delete-model-row-inlut-value', OperationInputValue.deleteRowAndSelectWithFileds);

$(document).on('change', '.js-render-new-client-with-alert', OperationInputValue.newClientFieldsWithAlert);

$(document).on('change', '.js-render-new-client', OperationInputValue.newClientFields);
