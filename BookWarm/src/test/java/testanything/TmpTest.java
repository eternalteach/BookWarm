package testanything;

import java.sql.Timestamp;

import org.junit.Test;

import com.book.warm.function.Function;

public class TmpTest {


	@Test
	public void stringToTimestampTest() {
		String str = "1990-12-13";
		Timestamp ts = null;
		ts = Function.StringToTimestampForAPI(str);
		System.out.println(ts);
	}

	@Test
	public void listToStringTest() {
		int[] a = null;
		int book_price_for_sale = (a)==null?0:a.length;
		System.out.println(book_price_for_sale);
	}
}
