<#--
Copyright 2011 Hemagenesis

Unlike Moqui and Apache OFBiz this is not open source or in the public
domain and may only be used under terms of a commercial license.
-->
<?xml version="1.0" encoding="UTF-8"?>
<actions xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="http://moqui.org/xsd/xml-actions-1.0.xsd">
<#visit simpleMethodRoot/>
</actions>

<#macro @element>
    <!-- NOTE: skipped element ${.node?node_name} -->
</#macro>
<#macro "simple-method">
<#recurse>
</#macro>

<#-- ========== Call Ops ========== -->
<#macro "call-simple-method">
    <script location="<#if .node["@xml-resource"]?has_content>${.node["@xml-resource"]?substring(0,.node["@xml-resource"]?length-4)}_</#if>${.node["@method-name"]}.xml"/>
</#macro>

<#-- ========== Entity Ops ========== -->
<#macro "make-value">
    <entity-make-value entity-name="${.node["@entity-name"]}"<#if .node["@map"]?has_content> map="${.node["@map"]}"</#if> value-field="${.node["@value-field"]}"/>
</#macro>
<#macro "set-nonpk-fields">
    <entity-set value-field="${.node["@value-field"]}"<#if .node["@map"]?has_content> map="${.node["@map"]}"</#if> include="nonpk"/>
</#macro>
<#macro "set-pk-fields">
    <entity-set value-field="${.node["@value-field"]}"<#if .node["@map"]?has_content> map="${.node["@map"]}"</#if> include="pk"/>
</#macro>
<#macro "sequenced-id">
    <!-- TODO: after migration make sure the value-field is populated, the Moqui element has a different pattern than the OFBiz one -->
    <entity-sequenced-id-primary value-field="${.node["@field"]?substring(0,.node["@field"]?index_of("."))}"/>
</#macro>
<#macro "make-next-seq-id">
    <entity-sequenced-id-secondary value-field="${.node["@value-field"]}"/>
</#macro>
<#macro "create-value">
    <entity-create value-field="${.node["@value-field"]}"/>
</#macro>
<#macro "store-value">
    <entity-update value-field="${.node["@value-field"]}"/>
</#macro>
<#macro "remove-value">
    <entity-delete value-field="${.node["@value-field"]}"/>
</#macro>
<#macro "entity-one">
    <entity-find-one entity-name="${.node["@entity-name"]}" value-field="${.node["@value-field"]}"<#if .node["@use-cache"]?has_content> cache="${.node["@use-cache"]}"</#if>/>
</#macro>
<#macro "entity-condition">
    <entity-find entity-name="${.node["@entity-name"]}" list="${.node["@list"]}"<#if .node["@use-cache"]?has_content> cache="${.node["@use-cache"]}"</#if><#if .node["@distinct"]?has_content> distinct="${.node["@distinct"]}"</#if>>
        <#recurse>
        <!-- TODO: subelements -->
    </entity-find>
</#macro>
<#macro "entity-and">
    <entity-find entity-name="${.node["@entity-name"]}" list="${.node["@list"]}"<#if .node["@use-cache"]?has_content> cache="${.node["@use-cache"]}"</#if>>
        <#recurse>
        <!-- TODO: subelements -->
    </entity-find>
</#macro>
<#macro "get-related-one">
    <entity-find-related-one value-field="${.node["@value-field"]}" relationship-name="${.node["@relation-name"]}" to-value-field="${.node["@to-value-field"]}"<#if .node["@use-cache"]?has_content> cache="${.node["@use-cache"]}"</#if>/>
</#macro>
<#macro "get-related">
    <entity-find-related value-field="${.node["@value-field"]}" relationship-name="${.node["@relation-name"]}" list="${.node["@list"]}"<#if .node["@map"]?has_content> map="${.node["@map"]}"</#if><#if .node["@order-by-list"]?has_content> order-by-list="${.node["@order-by-list"]}"</#if><#if .node["@use-cache"]?has_content> cache="${.node["@use-cache"]}"</#if>/>
</#macro>


<#macro "set">
    <set field="${.node["@field"]}"<#if .node["@from-field"]?has_content> from="${.node["@from-field"]}"</#if><#if .node["@value"]?has_content> value="${.node["@value"]}"</#if><#if .node["@default-value"]?has_content> default-value="${.node["@default-value"]}"</#if><#if .node["@type"]?has_content> type="${.node["@type"]}"</#if><#if .node["@set-if-empty"]?has_content> set-if-empty="${.node["@set-if-empty"]}"</#if>/>
</#macro>
<#macro "field-to-list">
    <script>${.node["@list"]}.add(${.node["@field"]})</script>
</#macro>
<#macro "field-to-result">
    <TODO/>
</#macro>
<#macro "now-timestamp">
    <script>${.node["@field"]} = ec.user.nowTimestamp</script>
</#macro>
<#macro "calculate">
    <TODO/>
</#macro>

<#macro "log">
    <log level="${.node["@level"]}" message="${.node["@message"]}"/>
</#macro>

<#macro "iterate">
    <TODO/>
</#macro>
<#macro "if">
    <TODO/>
</#macro>
<#macro "if-empty">
    <TODO/>
</#macro>
<#macro "if-compare">
    <TODO/>
</#macro>
<#macro "if-compare-field">
    <TODO/>
</#macro>

<#macro "add-error">
    <TODO/>
</#macro>
<#macro "check-errors">
    <TODO/>
</#macro>
<#macro "return">
    <TODO/>
</#macro>
