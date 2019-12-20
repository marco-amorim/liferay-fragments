<div class="containerCardNoticias">
    <#if entries?has_content>

      <#list entries[0..*2] as curEntry>

            <#assign assetEntryLocalService = serviceLocator.findService("com.liferay.asset.kernel.service.AssetEntryLocalService")>
            <#assign dlFileEntryLocalService = serviceLocator.findService("com.liferay.document.library.kernel.service.DLFileEntryLocalService")>
            <#assign viewURL = assetPublisherHelper.getAssetViewURL(renderRequest, renderResponse, curEntry, true)/>
            <#assign docXml = saxReaderUtil.read(curEntry.getAssetRenderer().getArticle().getContent()) />
            <#assign imagemNoticia = docXml.valueOf("//dynamic-element[@name='imagemNoticia']/dynamic-content/text()") />
            <#assign htmlNoticia = docXml.valueOf("//dynamic-element[@name='HTMLNoticia']/dynamic-content/text()") />
            <#assign assetRenderer = curEntry.getAssetRenderer() />

	<div class="layoutCardNoticias">
	    <div class="cardNoticias">

    	    <a href="${viewURL}" class="imagemCardNoticias">
            <img class="imagemCardNoticias" src="${getUrlImagem(imagemNoticia)}" >
          </a>
        
        <div class="corpoCardNoticias">
            <h6 class="tituloCardNoticias"><b>${htmlUtil.escape(assetRenderer.getTitle(locale))}</b></h6>
        <div class="textoCardNoticias">
            ${htmlNoticia?substring(0, 150)}
        </div>
    
    <#if curEntry.getPublishDate()??>

        <#setting locale = localeUtil.getDefault()>
        <#assign mesFormatado = dateUtil.getDate(curEntry.getPublishDate()?datetime, "MMMM", locale)>
        <#assign diaFormatado = dateUtil.getDate(curEntry.getPublishDate()?datetime, "dd", locale)>
        <#assign anoFormatado = dateUtil.getDate(curEntry.getPublishDate()?datetime, "yyyy", locale)>

        <div class="dataPubCardNoticias">
            <span class="mr-2 glyphicon glyphicon-time" aria-hidden="true"></span>
              ${diaFormatado} de ${mesFormatado} de ${anoFormatado}
        </div>
	  </#if>

      </div>
  </div>
</div>
	</#list>
</div>

<#function getUrlImagem xmlValue>
    <#local docUrl = "" />
    <#if xmlValue?has_content>
        <#local jsonObject = xmlValue?eval />
        <#local entryUuid = jsonObject.uuid />
        <#local entryGroupId = getterUtil.getLong(jsonObject.groupId) />
        <#local dlFileEntry = dlFileEntryLocalService.getDLFileEntryByUuidAndGroupId(entryUuid, entryGroupId) />
        <#local assetEntry = assetEntryLocalService.getEntry("com.liferay.document.library.kernel.model.DLFileEntry", dlFileEntry.fileEntryId) />
        <#local assetRenderer = assetEntry.assetRenderer />
        <#local docUrl = assetRenderer.getURLImagePreview(renderRequest) />
    </#if>
    <#return docUrl />
</#function>
</#if>