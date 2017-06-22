{**
 * templates/controllers/grid/user/reviewer/form/advancedSearchReviewerAssignmentForm.tpl
 *
 * Copyright (c) 2014-2016 Simon Fraser University Library
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Assigns the reviewer (selected from the reviewerSelect grid) to review the submission.
 *
 *}
<script type="text/javascript">
	$(function() {ldelim}
		// Attach the form handler for second form.
		$('#advancedSearchReviewerForm').pkpHandler('$.pkp.controllers.form.AjaxFormHandler');
	{rdelim});
</script>

{* The form that will create the review assignment.  A reviewer ID must be loaded in here via the grid above. *}
<form class="pkp_form" id="advancedSearchReviewerForm" method="post" action="{url op="updateReviewer"}" >
	{fbvElement type="hidden" id="reviewerId" value=$reviewerId}

	{include file="controllers/grid/users/reviewer/form/reviewerFormFooter.tpl"}

	{fbvFormButtons submitText="editor.submission.addReviewer"}
</form>
