$('.button').live('click', (function() {
	$('form#cash_balance_form').submit();
	console.log('submitted!');
}));
	