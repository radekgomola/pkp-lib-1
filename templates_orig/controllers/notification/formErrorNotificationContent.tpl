{**
 * controllers/notification/formErrorNotificationContent.tpl
 *
 * Copyright (c) 2014-2016 Simon Fraser University Library
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Display in place notifications.
 *}
{foreach key=field item=message from=$errors}
	<a href="#{$field|escape}">{$message}</a><br />
{/foreach}
