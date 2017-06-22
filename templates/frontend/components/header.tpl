{**
* lib/pkp/templates/frontend/components/header.tpl
*
* Copyright (c) 2014-2016 Simon Fraser University Library
* Copyright (c) 2003-2016 John Willinsky
* Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
*
* @brief Common frontend site header.
*
* @uses $isFullWidth bool Should this page be displayed without sidebars? This
*       represents a page-level override, and doesn't indicate whether or not
*       sidebars have been configured for thesite.
*}

{* Determine whether a logo or title string is being displayed *}
{assign var="showingLogo" value=true}
{if $displayPageHeaderTitle && !$displayPageHeaderLogo && is_string($displayPageHeaderTitle)}
    {assign var="showingLogo" value=false}
{/if}

<!DOCTYPE html>
<!--[if lte IE 9]><html class="old-browser no-js" lang="{$currentLocale|replace:"_":"-"}" xml:lang="{$currentLocale|replace:"_":"-"}"><![endif]-->
<!--[if IE 9 ]> <html class="ie9 no-js" lang="{$currentLocale|replace:"_":"-"}" xml:lang="{$currentLocale|replace:"_":"-"}"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js" lang="{$currentLocale|replace:"_":"-"}" xml:lang="{$currentLocale|replace:"_":"-"}"><!--<![endif]-->

{if !$pageTitleTranslated}{translate|assign:"pageTitleTranslated" key=$pageTitle}{/if}
{include file="core:frontend/components/headerHead.tpl"}
<body {*class="pkp_page_{$requestedPage|escape|default:"index"} pkp_op_{$requestedOp|escape|default:"index"}{if $showingLogo} has_site_logo{/if}"*}>
    <script type="text/javascript">
        // Initialise JS handler.
        $(function () {ldelim}
                $('body').pkpHandler(
                        '$.pkp.controllers.SiteHandler',
        {ldelim}
        {if $isUserLoggedIn}
                inlineHelpState: {$initialHelpState},
        {/if}
                toggleHelpUrl: {url|json_encode page="user" op="toggleHelp" escape=false},
                        toggleHelpOnText: {$toggleHelpOnText|json_encode},
                        toggleHelpOffText: {$toggleHelpOffText|json_encode},
        {include file="core:controllers/notification/notificationOptions.tpl"}
        {rdelim});
        {rdelim});    </script>
    <div class="pkp_structure_page">

        {* Header *}
        <header {*class="pkp_structure_head"*} class="header header--nav-under" {*id="headerNavigationContainer" role="banner"*} />
        <div {*class="pkp_head_wrapper *}class="row-main">
            <p class="header__logo" role="banner">
                <a href="#">
                    {include file="core:frontend/components/logo.tpl"}
                </a>
            </p>

            {* Search form *}
            {if !$noContextsConfigured}
                {include file="frontend/components/searchForm_simple.tpl" header=True}
            {/if}
            <nav id="menu-main" role="navigation" {*class="pkp_navigation_primary_row"*} class="header__menu" aria-label="{translate|escape key="common.navigation.site"}">
                <div {*class="pkp_navigation_primary_wrapper"*} class="header__menu-main">

                    {* Primary navigation menu for current application *}
                    {include file="frontend/components/primaryNavMenu.tpl"}

                    {* Primary site navigation *}
                    <script type="text/javascript">
                                // Attach the JS file tab handler.
                                $(function () {ldelim}
                                                $('#navigationPrimary').pkpHandler(
                                                        '$.pkp.controllers.MenuHandler');
                        {rdelim});
                    </script>

                </div>
                <a href="#" class="header__menu__title">
                    <span class="icon icon-bars"></span>
                    Menu
                </a>
                <div class="header__menu-toggle" aria-hidden="true"></div>
                {* User-specific login, settings and task management *}
                    {url|assign:fetchHeaderUrl router=$smarty.const.ROUTE_COMPONENT component="page.PageHandler" op="userNav" escape=false}
                    {load_url_in_div class="pkp_navigation_user_wrapper" id="navigationUserWrapper" url=$fetchHeaderUrl}
            </nav>            
                    

        </div><!-- .pkp_head_wrapper -->

    </header><!-- .pkp_structure_head -->

    {* Wrapper for page content and sidebars *}
    {if $isFullWidth}
        {assign var=hasLeftSidebar value=0}
    {/if}
    <div class="pkp_structure_content{if $hasLeftSidebar} has_left_sidebar{/if}">

        <script type="text/javascript">
            // Attach the JS page handler to the main content wrapper.
            $(function () {ldelim}
                    $('div.pkp_structure_main').pkpHandler('$.pkp.controllers.PageHandler');
            {rdelim});
        </script>

        <div class="pkp_structure_main" role="main">
