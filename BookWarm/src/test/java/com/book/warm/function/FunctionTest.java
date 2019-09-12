package com.book.warm.function;

import static org.junit.Assert.assertTrue;

import org.junit.Test;

public class FunctionTest {

	@Test
	public void test() {
		String str=	"2016-09-15T00:00:00.000+09:00";
		assertTrue(Function.StringToTimestampForAPI(str).toString().equals("2016-09-15 00:00:00.0"));
	}

}
