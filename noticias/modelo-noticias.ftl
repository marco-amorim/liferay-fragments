<#assign displaydate = .vars['reserved-article-display-date'].data>
<#setting locale = localeUtil.getDefault()>
<#assign displaydate = displaydate?datetime("EEE, d MMM yyyy HH:mm:ss Z")>
<#assign mesFormatado = dateUtil.getDate(displaydate, "MMMM", locale)>
<#assign diaFormatado = dateUtil.getDate(displaydate, "dd", locale)>
<#assign anoFormatado = dateUtil.getDate(displaydate, "yyyy", locale)>

<div class="noticias">
    <#if imagemNoticia.getData()?? && imagemNoticia.getData() != "">
        <img alt="${imagemNoticia.getAttribute("alt")}" data-fileentryid="${imagemNoticia.getAttribute("fileEntryId")}" src="${imagemNoticia.getData()}" />
    </#if>

    <div class="mt-5 tituloNoticias">
        <h1>${.vars['reserved-article-title'].data}</h1>
    </div>
    
    <div class="row detalhesNoticias">
    
        <div class="mr-auto autorNoticias">
            Texto: ${.vars['reserved-article-author-name'].data}
        </div>
        
        <div class="ml-auto dataNoticias">
        <span class="glyphicon glyphicon-time" aria-hidden="true"></span>
        ${diaFormatado} de ${mesFormatado?lower_case}, ${anoFormatado}
        </div>
    </div>
    
    <div class="corpoNoticias">
    ${HTMLNoticia.getData()}
    </div>

</div>