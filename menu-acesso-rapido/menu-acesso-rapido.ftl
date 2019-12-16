<#assign limitador = 0>
<#list nav_items as nav_item>

  <#if nav_item.getName()?lower_case == "acesso rapido" || nav_item.getName()?lower_case == "acesso rápido" && limitador < 1 >
    <#assign limitador++>
    <div class="menuAcessoRapido">

      <div class="container-interno row-fluid">
        
        <div class="mr-6 ml-6 logoAcessoRapido">

            <a class="${logo_css_class}" href="${site_default_url}" title="<@liferay.language_format arguments="${site_name}" key="go-to-x" />">
              <img class="logoAcessoRapidoImg" alt="${cp_nome_unimed}" src="${site_logo}" />
            </a>
            
        </div>
          
          <#if nav_item.hasBrowsableChildren()>
                      
            <#list nav_item.getChildren()[0..*4] as nav_child>
                    

                    <div class="mr-6 linkAcesso">
                      
                        <div class="mb-4">                        
                                 
                            <a id="link" href="${nav_child.getURL()}" ${nav_child.getTarget()}>
                               ${nav_child.getName()}
                            </a>

                           <a class="btn-collapse-menu glyphicon glyphicon-chevron-down"></a>
    
                        </div> 
              
                <#if nav_child.hasBrowsableChildren()>

                  <div class="sublinks">
                    <#list nav_child.getChildren()[0..*7] as nav_child2>

                      <div class="mb-3">

                          <a id="sublink" href="${nav_child2.getURL()}" ${nav_child2.getTarget()}>
                            ${nav_child2.getName()}
                          </a>

                      </div>
                
                    </#list>
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

</script>