<#--
Copyright 2011 Hemagenesis

Unlike Moqui and Apache OFBiz this is not open source or in the public
domain and may only be used under terms of a commercial license.
-->
<#assign typeMap = {
"blob":"binary-very-long",
"object":"binary-very-long",
"byte-array": "binary-very-long",
"date-time":"date-time", "date":"date", "time":"time",

"currency-amount":"currency-amount", "currency-precise":"currency-precise",
"fixed-point":"number-decimal", "floating-point":"number-float", "number-float":"number-float", "numeric":"number-integer",

"id":"id", "id-long":"id-long", "id-vlong":"id-long",
"indicator":"text-indicator", "very-short":"text-short", "short-varchar":"text-medium",
"long-varchar":"text-medium", "very-long":"text-very-long",

"comment":"text-medium", "description":"text-medium", "name":"text-medium", "value":"text-medium",
"credit-card-number":"text-short", "credit-card-date":"text-short", "email":"text-medium", "url":"text-medium",
"id-ne":"id", "id-long-ne":"id-long", "id-vlong-ne":"id-long", "tel-number":"text-medium"
}/>
<#assign excludedEntities = ["Affiliate","AddressMatchMap",
"AgreementAttribute","AgreementContentType","AgreementContent","AgreementFacilityAppl","AgreementGeographicalApplic","AgreementItemAttribute","AgreementItemTypeAttr","AgreementItemType","AgreementItem","AgreementPartyApplic","AgreementProductAppl","AgreementPromoAppl","AgreementRole","AgreementTermAttribute","AgreementTerm","AgreementTypeAttr","AgreementType","AgreementWorkEffortApplic","Agreement","AudioDataResource",
"BrowserType",
"CarrierGeoMapping","CartAbandonedLine","CatalinaSession","CharacterSet","CommunicationEventProduct","Component","CustRequestItemWorkEffort","ConfigOptionProductOption","ContentAttribute","ContentKeyword","ContentMetaData","ContentOperation","ContentPurpose", "ContentPurposeOperation", "ContentPurposeType", "ContentRevision", "ContentRevisionItem","ContentSearchConstraint","ContentSearchResult", "ContentStatus", "ContentTypeAttr","CountryCapital","CountryCode", "CountryTeleCode", "CustomTimePeriod",
"CustRequest","CustRequestAttribute","CustRequestCategory","CustRequestCommEvent","CustRequestContent","CustRequestItem","CustRequestItemNote",
"CustRequestNote","CustRequestParty","CustRequestResolution","CustRequestStatus","CustRequestType","CustRequestTypeAttr","CustRequestWorkEffort",
"DataSource","DataCategory","DataSourceType","DataTemplateType","DesiredFeature",
"DataResourceAttribute","DataResourceMetaData","DataResourcePurpose","DataResourceRole","DataResourceType","DataResourceTypeAttr",
"Document","DocumentAttribute","DocumentType","DocumentTypeAttr",
"EntityAuditLog","EmailAddressVerification",
"FacilityLocationGeoPoint","FacilityTypeAttr","FileExtension","FacilityContent",
"ImageDataResource","InventoryItemAttribute","InventoryItemLabelAppl","InventoryItemLabelType","InventoryItemLabel","InventoryItemTypeAttr","ItemIssuanceRole"
,"JobManagerLock","JobSandbox",
"KeywordThesaurus",
"LotContentType","LotContent","LotWorkEffort",
"MarketInterest","MetaDataPredicate","MimeTypeHtmlTemplate","MimeType","MrpEventType","MrpEvent",
"NeedType",
"OrderAdjustmentBilling","OrderAdjustmentTypeAttr","OrderBlacklistType","OrderBlacklist","OrderDeliverySchedule","OrderHeaderWorkEffort","OrderItemPriceInfo","OrderItemsReadyToPick","OrderProductPromoCode","OrderRequirementCommitment","OrderTermAttribute","OrderTypeAttr","OtherDataResource",
"PartyAcctgPreference","PartyClassContentType","PartyClassGroupContent","PartyDataSource","PartyGeoPoint","PartyIcsAvsOverride","PartyInvitationGroupAssoc","PartyInvitationRoleAssoc","PartyInvitation","PartyNeed","PartyNote","PartyProductType","PartyProduct","PartyProfileDefault","PartyQualType","PartyQual","PaymentMethodTypeTerm","PeriodType","PlatformType","PlatformType",
"PortalPageColumn","PortalPagePortlet","PortalPage","PortalPortlet","PortletAttribute","PortletCategory","PortletPortletCategory","PostalAddressBoundary","ProdConfItemContentType","ProdConfItemContent","ProductCalculatedInfo","ProductCategoryAttribute","ProductCategoryTypeAttr","ProductConfigConfig","ProductConfigItem","ProductConfigOptionIactn","ProductConfigOption","ProductConfigProduct","ProductConfigStats",
"ProductConfig","ProductFeatureApplAttr","ProductFeatureCategoryAppl","ProductFeatureCategory","ProductFeatureCatGrpAppl","ProductFeatureDataResource","ProductFeatureGroupAppl","ProductFeatureGroup","ProductFeatureIactnType","ProductFeatureIactn","ProductFeaturePrice","ProductGeo","ProductGroupOrder","ProductKeyword","ProductMaintType","ProductMaint","ProductMeterType","ProductMeter","ProductOrderItem","ProductPaymentMethodType","ProductPriceActionType","ProductPriceAction","ProductPriceAutoNotice","ProductPriceChange","ProductPriceCond","ProductPricePurpose","ProductPriceRule","ProductPriceType",
"ProductPromoAction","ProductPromoCategory","ProductPromoCodeEmail","ProductPromoCodeParty","ProductPromoCode","ProductPromoCond","ProductPromoContent","ProductPromoProduct","ProductPromoRule","ProductPromoUse","ProductPromo","ProductReview","ProductRole","ProductSearchConstraint","ProductStoreGroupMember","ProductStoreGroupRole","ProductStoreGroupRollup","ProductStoreGroupType","ProductStoreGroup","ProductStoreKeywordOvrd","ProductStorePaymentNetwork","ProductStorePaymentSetting","ProductStorePromoAppl","ProductStoreSurveyAppl","ProductStoreVendorPayment","ProductStoreVendorShipment","ProductSubscriptionResource","ProtectedView","ProtocolType",
"QuantityBreakType","QuantityBreak",
"RecurrenceInfo","RecurrenceRule","RejectionReason","RequirementAttribute","RequirementCustRequest","RequirementRole","RequirementStatus","RequirementType","Requirement","ReturnItemBilling","RuntimeData",
"ServerHitBin","ServerHitType","ServerHit","ServiceSemaphore","ShipmentGatewayDhl","ShipmentItemBilling","ShoppingListItemSurvey","ShoppingListItem","ShoppingListType","ShoppingListWorkEffort","ShoppingList","SubscriptionActivity","SubscriptionAttribute","SubscriptionCommEvent","SubscriptionFulfillmentPiece","SubscriptionResource","SubscriptionTypeAttr","SubscriptionType","Subscription","SupplierPrefOrder","SupplierProductFeature","SupplierProduct","SupplierRatingType","SurveyApplType","SurveyMultiRespColumn","SurveyMultiResp","SurveyPage","SurveyQuestionAppl","SurveyQuestionCategory","SurveyQuestionOption","SurveyQuestionType","SurveyQuestion","SurveyResponseAnswer","SurveyResponse","SurveyTrigger","Survey",
"TarpittedLoginView","TaxAuthorityRateType","TemporalExpressionAssoc","TemporalExpression","TenantComponent","TenantDataSource","TenantDomainName","TenantKeyEncryptingKey","Tenant","TermTypeAttr","TermType",
"UserAgentMethodType","UserAgentType","UserAgent","UserLoginHistory","UserLoginSecurityQuestion","UserLoginSession",
"ValidContactMechRole","VendorProduct","Vendor","VideoDataResource","Visitor","Visitor","Visit","Visit","VisualThemeResource","VisualThemeSet","VisualTheme",
"WebAnalyticsConfig","WebAnalyticsType","WebPage","WebPreferenceType","WebSiteCatalog","WebSiteContentType","WebSiteContent","WebSitePathAlias","WebSitePublishPoint","WebSiteRole","WebUserPreference","WorkEffortAssocAttribute","WorkEffortAssocTypeAttr","WorkEffortAssocType","WorkEffortAssoc","WorkEffortAttribute","WorkEffortBilling","WorkEffortContactMech","WorkEffortContentType","WorkEffortContent","WorkEffortDeliverableProd","WorkEffortEntityRel","WorkEffortEventReminder","WorkEffortFixedAssetAssign","WorkEffortFixedAssetStd","WorkEffortGoodStandardType","WorkEffortGoodStandard","WorkEffortPartyAssignment","WorkEffortPurposeType","WorkEffortStatus","WorkEffortType","WorkEffort","WorkOrderItemFulfillment","WorkReqFulfType","WorkRequirementFulfillment",
"X509IssuerProvision",
"ReportConfig","ItemThreshold","Expedited","OnPreorder","OnBackorder","CmbdPreorderBackorder","CmbdPreoBackoStyClrSiz","UnreconciledShipment","UnrecShipOrderSummary","PreorderStyleColorSize","PreOrderItemAllBrand","WmiShippedYesterday","WmiBacklog","WmiBacklogUnits","UnreconciledHoldItem","PurchaseOrders","CancelledAfterBrokered","DailyShippedUnitsStore","DailyShippedUnitsStyle","WmiRejectShipment","BopisOrders","CreatedShopifyOrders","ReleasedPreorders","ReleasedPreordersStyle","OffPreorder","OffBackorder","SendSaleUnfillableItems","OnTracShipment","CommissionSales","CommissionReturn","ShipmentTrackingNum","CancelledOrders","FacilityOnOff","FacilityUpcOnOff","DailyOrderList","DailyOrderSummary","DailyReturnList","DailyReturnSummary","DailyAppeasementList","DailyAppeasementSummary","UnfilableItem","PreorderBackorderStats","SalesSummary","YtyDemand","ReturnRateYtd","ReturnRateWeekly","PaymentCaptureNotShipped","InvoicingCondensed","SalesByItemLevelCityState","ShippingFeeTotal","VarianceRecords","ShippingRefundTotal","ShippedUnitsByLocation","RejectionRate","StoreWarehouseShippedRate","ShippedOrdersMonthly","ReturnShippingRefundByOrder","ReturnOrdersMonthly","SalesShippingRevenueByOrder","DemandTracking","StoreWarehouseWeeklyShiUnits","StoreWarehouseMonthlyShiUnits","SalesByState","SalesShippingRevenueByState","ReturnsByState","ReturnsShippingAdjByState","SalesByCity","SalesShippingRevenueByCity","ReturnsByCity","ReturnsShippingAdjByCity","ReturnsByOrder","BrokeredItems","RejectedItems","ShippedItems","ReleasedBackorders","ReleasedBackordersStyle", "UnfillableHoldItem","DailyPoBoDeliveryUPC","TotalPoBoDeliveryUPC"
] />
<?xml version="1.0" encoding="UTF-8"?>
<!--
Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements.  See the NOTICE file
distributed with this work for additional information
regarding copyright ownership.  The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License.  You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied.  See the License for the
specific language governing permissions and limitations
under the License.
-->

<entities xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="http://moqui.org/xsd/entity-definition-3.xsd">
<#visit entityXmlRoot/>
</entities>

<#macro @element>
    <!-- TODO: skipped element ${.node?node_name} -->
</#macro>
<#macro "entitymodel">
<#recurse>
</#macro>

<#macro "description"><description><#escape x as x?xml>${.node}</#escape></description></#macro>

<#-- ========== entity and extend-entity ========== -->
<#macro "entity">
    <#local ename = .node["@entity-name"] />
    <#if !excludedEntities?seq_contains(ename)>
    <#-- TODO: read from entitygroup.xml file(s) to find value (if applicable) for group-name attribute -->
    <entity entity-name="${.node["@entity-name"]}" package="${.node["@package-name"]}"<#if .node["@table-name"]?has_content> table-name="${.node["@table-name"]}"</#if><#if .node["@sequence-bank-size"]?has_content> sequence-bank-size="${.node["@sequence-bank-size"]}"</#if><#if .node["@enable-lock"]?has_content> optimistic-lock="${.node["@enable-lock"]}"</#if><#if .node["@no-auto-stamp"]?has_content> no-update-stamp="${.node["@no-auto-stamp"]}"</#if><#if .node["@never-cache"]?if_exists == "true"> cache="never"</#if> <#if groupName?has_content>group="${groupName}"</#if>>
          <#recurse>
    </entity>
    </#if>
</#macro>

<#macro "extend-entity">
    <#local entityName = .node["@entity-name"] />
    <#if !excludedEntities?seq_contains(entityName)>
    <#local packageName = packageMap.get(entityName)! />
    <extend-entity entity-name="${.node["@entity-name"]}" package="${packageName!}" <#if groupName?has_content>group="${groupName!}"</#if>>
        <#recurse>
    </extend-entity>
    </#if>
</#macro>

<#macro "field">
    <#assign isPk = false>
    <#list .node?parent["prim-key"] as primKey><#if primKey["@field"] == .node["@name"]><#assign isPk = true></#if></#list>
        <field name="${.node["@name"]}" type="${typeMap[.node["@type"]]}"<#if isPk> is-pk="true"</#if><#if .node["@col-name"]?has_content> column-name="${.node["@col-name"]}"</#if><#if .node["@encrypt"]?has_content> encrypt="${.node["@encrypt"]}"</#if><#if .node["@enable-audit-log"]?has_content> enable-audit-log="${.node["@enable-audit-log"]}"</#if>><#recurse></field>
</#macro>
<#macro "prim-key"><#-- ignore, is handled in the field macro --></#macro>

<#macro "relation">
        <#local relEntityName = .node["@rel-entity-name"] />
        <#if !excludedEntities?seq_contains(relEntityName)>
        <#local packageName = packageMap.get(relEntityName)! />
        <#if packageName?has_content>
            <#local relEntityName = packageName + "." + relEntityName/>
        <relationship type="${.node["@type"]}"<#if .node["@fk-name"]?has_content> fk-name="${.node["@fk-name"]}"</#if><#if .node["@title"]?has_content> title="${.node["@title"]?cap_first}"</#if> related="${relEntityName}">
        <#recurse>
        </relationship>
        </#if>
        </#if>
</#macro>
<#macro "key-map">
            <key-map field-name="${.node["@field-name"]}"<#if .node["@rel-field-name"]?has_content> related="${.node["@rel-field-name"]}"</#if>/>
</#macro>

<#macro "index">
        <index name="${.node["@name"]}"<#if .node["@unique"]?has_content> unique="${.node["@unique"]}"</#if>>
            <#recurse>
        </index>
</#macro>
<#macro "index-field">
            <index-field name="${.node["@name"]}"/>
</#macro>

<#-- ========== view-entity ========== -->

<#--<#macro "view-entity">
    <view-entity entity-name="${.node["@entity-name"]}" package="${.node["@package-name"]}"<#if .node["@never-cache"]?if_exists == "true"> cache="never"</#if>>
        <#recurse>
    </view-entity>
</#macro>-->
<#macro "member-entity">
    <#-- <#assign viewLink = null> -->
    <#list .node?parent["view-link"] as vl><#if vl["@rel-entity-alias"] == .node["@entity-alias"]>
        <#assign viewLink = vl><#break>
    </#if></#list>
        <member-entity entity-alias="${.node["@entity-alias"]}" entity-name="${.node["@entity-name"]}"<#if viewLink?exists> join-from-alias="${viewLink["@entity-alias"]}"<#if viewLink["@rel-optional"]?if_exists == "true"> join-optional="true"</#if></#if>>
        <#recurse>
        <#if viewLink?exists><#list viewLink["key-map"] as keyMap>
        <#visit keyMap>
        </#list></#if>
        <#if viewLink?exists><#list viewLink["entity-condition"] as entityCondition>
        <#visit entityCondition>
        </#list></#if>
        </member-entity>
</#macro>
<#macro "view-link"></#macro>


<#macro "alias-all">
        <alias-all entity-alias="${.node["@entity-alias"]}"<#if .node["@prefix"]?has_content> prefix="${.node["@prefix"]}"</#if>>
        <#recurse>
        </alias-all>
</#macro>
<#macro "exclude">
            <exclude field="${.node["@field"]}"/>
</#macro>
<#macro "alias">
        <alias entity-alias="${.node["@entity-alias"]}" name="${.node["@name"]}"<#if .node["@field"]?has_content> field="${.node["@field"]}"</#if><#if .node["@function"]?has_content> function="${.node["@function"]}"</#if>>
        <#recurse>
        </alias>
</#macro>
<#macro "complex-alias">
            <complex-alias>
                <!-- TODO: support complex-alias -->
                <#recurse>
            </complex-alias>
</#macro>

<#macro "entity-condition">
    <entity-condition>
        <!-- TODO: support entity-condition
        <xs:attribute name="filter-by-date" default="false">
            <xs:simpleType>
                <xs:restriction base="xs:token">
                    <xs:enumeration value="true"/>
                    <xs:enumeration value="false"/>
                    <xs:enumeration value="by-name"/>
                </xs:restriction>
            </xs:simpleType>
        </xs:attribute>
        <xs:attribute name="distinct" default="false" type="boolean"/>
        -->
        <#recurse>
    </entity-condition>
</#macro>
<#macro "condition-expr">
<#--    <econdition>-->
        <!-- TODO: support condition-expr -->
        <#recurse>
<#--    </econdition>-->
</#macro>
<#macro "condition-list">
    <econditions>
        <!-- TODO: support condition-list -->
        <#recurse>
    </econditions>
</#macro>
<#macro "having-condition-list">
    <having-econditions>
        <!-- TODO: support having-condition-list -->
        <#recurse>
    </having-econditions>
</#macro>
<#macro "order-by">
        <order-by field-name="${.node["@field-name"]}"/>
</#macro>