<?php

/**
 * @file tests/classes/validation/ValidatorISSNTest.inc.php
 *
 * Copyright (c) 2013-2014 Simon Fraser University Library
 * Copyright (c) 2000-2014 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @class ValidatorISSNTest
 * @ingroup tests_classes_validation
 * @see ValidatorISSN
 *
 * @brief Test class for ValidatorISSN.
 */

import('lib.pkp.tests.PKPTestCase');
import('lib.pkp.classes.validation.ValidatorISSN');

class ValidatorISSNTest extends PKPTestCase {
	/**
	 * @covers ValidatorISSN
	 * @covers ValidatorRegExp
	 * @covers Validator
	 */
	public function testValidatorISSN() {
		$validator = new ValidatorISSN();
		self::assertTrue($validator->isValid('0378-5955')); // Valid
		self::assertFalse($validator->isValid('03785955')); // Missing dash
		self::assertFalse($validator->isValid('1234-5678')); // Wrong check digit
	}
}

?>
