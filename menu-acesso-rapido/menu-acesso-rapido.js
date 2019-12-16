$(window).on('load resize', function() {

  if (window.innerWidth <= 1024) {

     $('.sublinks').addClass('agregador-submenu-fechado');
     $('.linkAcesso').removeClass('mr-6');
     $('.logoAcessoRapido').removeClass('ml-6');

  } else {

     $('.sublinks').removeClass('agregador-submenu-fechado');
     $('.linkAcesso').addClass('mr-6');
     $('.logoAcessoRapido').addClass('ml-6');
  }
});

$('.glyphicon-chevron-down').click(function() {
$(this).toggleClass('active');
});

$('.btn-collapse-menu').click(function() {
$(this).parent().parent().children('.sublinks').toggleClass('agregador-submenu-aberto');
});