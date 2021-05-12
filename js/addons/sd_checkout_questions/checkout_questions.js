(function (_, $) {
  $(document).ready(function () {  

    $('form.form-edit .cm-combo-select').on('change', function() {
    		if(this.value == 'S') {     
    			$('.select_type').show();
    		} else {
    			$('.select_type input').val('');
    			$('.select_type').hide();
    		}
    		
  	});
  });

})(Tygh, Tygh.$);