package com.book.warm.function;

import java.sql.Timestamp;

public class Function {
	public static Timestamp StringToTimestampSimple(String strdate) {
		System.out.println("only 'yyyy-mm-dd'");
		strdate += " 00:00:00.0";
		Timestamp timeStamp = Timestamp.valueOf(strdate);
		System.out.println(timeStamp);
		return timeStamp;
	}
	
	public static Timestamp StringToTimestampForAPI(String strdate) {
		System.out.println("date format is yyyy-mm-dd+xxxxxxxx");
		strdate=strdate.substring(0, 10);
		return StringToTimestampSimple(strdate);
	}
	
	
}
