$(window).ready(() => {

  controleMenu();
});

$(window).resize(() => {

  controleMenu();
});

function controleMenu() {

  if (window.innerWidth <= 1024) {
    
    console.log('ESTOU DENTRO DO IF');
    $('.sublinks').addClass('agregador-submenu-fechado');

  } else {
    console.log('ESTOU DENTRO DO ELSE');
    $('.sublinks').removeClass('agregador-submenu-fechado');

  }
}

$('.glyphicon-chevron-down').click(function() {
$(this).toggleClass('active');
});

$('.btn-collapse-menu').click(function() {
$(this).parent().parent().children('.sublinks').toggleClass('agregador-submenu-fechado');
});