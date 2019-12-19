<#assign limitador = 0>
<#list nav_items as nav_item>

  <#if nav_item.getName()?lower_case == "acesso rapido" && limitador < 1 || nav_item.getName()?lower_case == "acesso rápido" && limitador < 1 >
    <#assign limitador++>
    <div class="container menuAcessoRapido">

      <div class="container-interno row-fluid">
        
        <div class="logoAcessoRapido">

            <a class="${logo_css_class}" href="${site_default_url}" title="<@liferay.language_format arguments="${site_name}" key="go-to-x" />">
              <img class="logoAcessoRapidoImg" alt="${cp_nome_unimed}" src="${site_logo}" />
            </a>
            
        </div>
          
          <#if nav_item.hasBrowsableChildren()>
                      
            <#list nav_item.getChildren()[0..*4] as nav_child>
                    

                    <div class="linkAcesso">
                      
                        <div class="linkPai">                        
                                 
                            <a id="link" href="${nav_child.getURL()}" ${nav_child.getTarget()}>
                               ${nav_child.getName()}
                            </a>
              
                <#if nav_child.hasBrowsableChildren()>

                            <a class="btn-collapse-menu glyphicon glyphicon-chevron-down"></a>
    
                        </div> 

                  <div class="sublinks">
                    <#list nav_child.getChildren()[0..*7] as nav_child2>

                      <div class="linkFilho">

                          <a id="sublink" href="${nav_child2.getURL()}" ${nav_child2.getTarget()}>
                            ${nav_child2.getName()}
                          </a>

                      </div>
                
                    </#list>
                  </div>

                  <#else>
                        </div>
                </#if>
                    </div> 
            </#list>
          </#if>

      </div>
    </div>

  </#if>
    
</#list>

<script>

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

</script>