<#--
Copyright 2011 Hemagenesis

Unlike Moqui and Apache OFBiz this is not open source or in the public
domain and may only be used under terms of a commercial license.
-->
<#assign skipEntityies= ["SecurityGroup", "SecurityGroupPermission", "SecurityPermission", "Content", "ContentAssoc","ContentAssocType", "ContentType",
"DataResource", "ElectronicText", "JobSandbox", "RuntimeData", "TemporalExpression", "CountryCode", "CountryTeleCode", "CountryCapital", "TemporalExpressionAssoc",
"WebSiteContentType", "WebSiteContent", "ProductStoreGroup", "WebSitePathAlias", "ProductMaintType", "SupplierPrefOrder", "ContentPurpose", "DataResourceType",
"ProdConfItemContentType","ProductFeatureIactnType","ProductMeterType","ProductPriceType","ProductPriceActionType",
"ProductPricePurpose","ContentMetaData","ContentAttribute","DataTemplateType","MimeType","CountryAddressFormat","DataSourceType",
"AgreementType","UomType","ContentPurposeType","VisualThemeSet","ServerHitType","ContentPurposeType","FileExtension","GeoAssocType",
"AgreementItemType","AgreementType","AgreementContentType","PeriodType","SubscriptionType","ProductFeatureCategory","QuantityBreakType",
"VisualTheme","MimeTypeHtmlTemplate","VisualTheme","RequirementType","DataCategory","WebAnalyticsType","MetaDataPredicate","PartyClassContentType",
"ShoppingListType","PartyProductType", "WebSite","ContentAssocPredicate","PartyAcctgPreference", "EmailTemplateSetting", "UserLogin","UserLoginSecurityGroup", "CustomMethodType", "CustomMethod", "GeoPoint", "OrderContentType", "GeoType", "UserPreference", "UomGroup"
]
/>
<#assign geoAssocTypeMap = {
    "GROUP_MEMBER": "GAT_GROUP_MEMBER",
    "REGIONS": "GAT_REGIONS",
    "COUNTY_SEAT": "GAT_COUNTY_SEAT"
} />
<#assign geoTypeMap = {
    "CITY": "GEOT_CITY",
    "STATE": "GEOT_STATE",
    "POSTAL_CODE": "GEOT_POSTAL_CODE",
    "COUNTRY": "GEOT_COUNTRY",
    "COUNTY": "GEOT_COUNTY",
    "COUNTY_CITY": "GEOT_COUNTY_CITY",
    "MUNICIPALITY": "GEOT_MUNICIPALITY",
    "PROVINCE":"GEOT_PROVINCE",
    "TERRITORY":"GEOT_TERRITORY",
    "REGION": "GEOT_REGION",
    "GROUP":"GEOT_GROUP",
    "SALES_TERRITORY": "GEOT_SALES_REGION",
    "SERVICE_TERRITORY":"GEOT_SERVICE_REGION"

}/>
<#assign uomTypeMap = {
    "CURRENCY_MEASURE": "UT_CURRENCY_MEASURE",
    "DATA_MEASURE":"UT_DATA_MEASURE",
    "DATASPD_MEASURE": "UT_DATASPD_MEASURE",
    "TIME_FREQ_MEASURE": "UT_TIME_FREQ_MEASURE",
    "LENGTH_MEASURE": "UT_LENGTH_MEASURE",
    "AREA_MEASURE":"UT_AREA_MEASURE",
    "VOLUME_LIQ_MEASURE": "UT_VOLUME_LIQ_MEAS",
    "VOLUME_DRY_MEASURE": "UT_VOLUME_DRY_MEAS",
    "WEIGHT_MEASURE": "UT_WEIGHT_MEASURE",
    "ENERGY_MEASURE": "UT_ENERGY_MEASURE",
    "TEMP_MEASURE": "UT_TEMP_MEASURE",
    "OTHER_MEASURE": "UT_OTHER_MEASURE"
}/>
<#assign dataSourceTypeMap = {
    "PURCHASED_DATA": "DST_PURCHASED_DATA",
    "MAILING_LIST_SIGNUP": "DST_MAILING_SIGNUP"
}/>
<?xml version="1.0" encoding="UTF-8"?>
<entity-facade-xml type="${reader}">
    <#visit entityXmlRoot/>
</entity-facade-xml>

<#macro "entity-engine-xml">
    <#recurse>
</#macro>
<#macro @element>
  <#local entityName = .node?node_name/>
  <#if !skipEntityies?seq_contains(entityName)>
    <#local isEntityDefined = ec.entityFacade.isEntityDefined(entityName)/>
    <#if isEntityDefined>
      <#local ed = ec.entityFacade.getEntityDefinition(entityName) />
    <${ed.getFullEntityName()}<#list ed.getAllFieldNames() as key><#if .node["@"+key]?has_content> ${key}="<#if "description" ==key><#escape x as x?xml>${.node["@"+key]}</#escape><#else>${.node["@"+key]}</#if>"</#if></#list>/>
    <#else >
            <!-- TODO: skipped data preparation for entity ${.node?node_name} -->
    </#if>
    </#if>
</#macro>
<#macro "StatusValidChange">
    <moqui.basic.StatusFlowTransition statusFlowId="Default" statusId="${.node["@statusId"]}" toStatusId="${.node["@statusId"]}" transitionName="${.node["@transitionName"]}"<#if .node["@transitionSequence"]?has_content> transitionSequence="${.node["@transitionSequence"]}"</#if><#if .node["@conditionExpression"]?has_content> conditionExpression="${.node["@conditionExpression"]}"</#if>/>
</#macro>
<#macro "UomConversion">
    <moqui.basic.UomConversion uomConversionId="${.node["@uomId"]}<#if .node["@uomIdTo"]?has_content>_${.node["@uomIdTo"]}</#if>" uomId="${.node["@uomId"]}" toUomId="${.node["@uomIdTo"]}" conversionFactor="${.node["@conversionFactor"]}"/>
</#macro>
<#macro "GeoAssoc">
    <moqui.basic.GeoAssoc geoId="${.node["@geoId"]}" toGeoId="${.node["@geoIdTo"]}" geoAssocTypeEnumId="${(geoAssocTypeMap[.node["@geoAssocTypeId"]])!''}"/>
</#macro>
<#macro "Geo">
    <moqui.basic.Geo geoId="${.node["@geoId"]}" geoName="${.node["@geoName"]}"<#if .node["@abbreviation"]?has_content> geoCodeAlpha3="${.node["@abbreviation"]}"</#if><#if .node["@geoCode"]?has_content> geoCodeAlpha2="${.node["@geoCode"]}"</#if><#if .node["@geoSecCode"]?has_content> geoCodeNumeric="${.node["@geoSecCode"]}"</#if><#if .node["@wellKnownText"]?has_content> wellKnownText="${.node["@wellKnownText"]}"</#if> geoTypeEnumId="${(geoTypeMap[.node["@geoTypeId"]])!''}"/>
</#macro>
<#macro "Uom">
    <moqui.basic.Uom uomId="${.node["@uomId"]}"<#if .node["@abbreviation"]?has_content> abbreviation="${.node["@abbreviation"]}"</#if><#if .node["@numericCode"]?has_content> numericCode="${.node["@numericCode"]}"</#if> uomTypeEnumId="${(uomTypeMap[.node["@uomTypeId"]])!''}"/>
</#macro>
<#macro "DataSource">
    <moqui.basic.DataSource dataSourceId="${.node["@dataSourceId"]}"<#if .node["@description"]?has_content> description="${.node["@description"]}"</#if> dataSourceTypeEnumId="${(dataSourceTypeMap[.node["@dataSourceTypeId"]])!''}"/>
</#macro>
<#macro "StatusType">
    <moqui.basic.StatusType statusTypeId="${.node["@statusTypeId"]}"<#if .node["@parentTypeId"]?has_content> parentTypeId="${.node["@parentTypeId"]}"</#if><#if .node["@description"]?has_content> description="${.node["@description"]}"</#if>/>
</#macro>

