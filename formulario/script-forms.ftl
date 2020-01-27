<script>

const tooltipErroEmail = "E-mail inválido!";
const tooltipErroObrigatorio = "Campo obrigatório!";
var label;
var textoDigitado;
var input = $('.form-group').find('input');
var count;
var searchElement;

$('.select-field-trigger').click(function() {
      $(this).children().children('.lexicon-icon-caret-double').toggleClass('active');
      $(this).css('border', '1px solid #333333');
});

$('.ddm-select-dropdown').focusout(function() {
      $('.lexicon-icon-caret-double').removeClass('active');
      $('.select-field-trigger').css('border', '1px solid #C1C8CD');
});

$('.lfr-ddm-form-submit').click(function() {
      
      setTimeout(function() {
            waitForElement();
      }, 500);

});

$(input).keyup(function() {

      $('.tooltip').remove();
      if (!$(this).siblings('.form-feedback-group').find('.form-feedback-item').length) {

            $(this).css('border', '1px solid #C1C8CD');

      } else {

            $(this).css('border', '1px solid #E62847');
      }

});


$(input).focusout(function() {
      
      textoDigitado = $(this).val()
      count = 0;
      searchElement = setInterval(waitForElement, 100);
      if (!$(this).siblings('.form-feedback-group').find('.form-feedback-item.help-block').length) {

            $(this).css('border', '1px solid #C1C8CD');

      } else {

            $(this).css('border', '1px solid #E62847');
      }

  });

function waitForElement() {
    if (!$('.form-feedback-item.help-block').length && count < 20) {

      count++;
      $('.form-feedback-item').parent('.form-feedback-group').parent('.form-group').find('input').css('border', '1px solid #E62847');
      window.requestAnimationFrame(waitForElement);
      console.log('procurando')
      
    } else {
       clearInterval(searchElement);
       tooltipErro();
       console.log('encontrado')
     }
};

function tooltipErro() {
                  
             $('.form-feedback-item.help-block').mouseover(function() {

                   label = $(this).parent().parent('.form-group').find('.form-feedback-group').siblings('label');
                   $(this).attr('data-toggle', 'tooltip');
                   $(this).attr('data-placement', 'top');
                        
                  if ($(this).parent('.form-feedback-group').children('.tooltip__erro').length == 0) {

                            for ( i = 0; i < label.length; label++ ) {

                                 if ( label[i].innerText.indexOf("E-mail") !== -1 && textoDigitado !== "" && textoDigitado !== undefined ) {
                                       $(this).attr('data-original-title', tooltipErroEmail);

                                } else {
                                       $(this).attr('data-original-title', tooltipErroObrigatorio);
                               }
                          }

                    }

                    $(this).tooltip('show');
                        
                   });

                  $('.form-feedback-item.help-block').mouseout(function() {
                        $(this).tooltip('hide');
                  });

                  $('.form-feedback-item.help-block').removeClass('help-block');
                  $('.form-feedback-item').parent('.form-feedback-group').parent('.form-group').find('input').css('border', '1px solid #E62847');
};

</script>