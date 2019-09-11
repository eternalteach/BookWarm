package testanything;

import java.sql.Timestamp;

import org.junit.Test;

import com.book.warm.function.Function;

public class TmpTest {

	@Test
	public void stringToTimestampTest() {
		String str="1990-12-13";
		Timestamp ts=null;
		ts=Function.StringToTimestamp(str);
		System.out.println(ts);
	}
	
	@Test
	public void listToStringTest() {
		
		
	}
}
