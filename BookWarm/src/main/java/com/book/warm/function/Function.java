package com.book.warm.function;

import java.sql.Timestamp;

public class Function {
	public static Timestamp StringToTimestampSimple(String strdate) {
		System.out.println("only 'yyyy-mm-dd'");
		strdate += " 00:00:00.0";
		System.out.println("strdate : " + strdate);
		Timestamp timeStamp = Timestamp.valueOf(strdate);
		System.out.println("timeStamp : " + timeStamp);
		return timeStamp;
	}
	
	public static Timestamp StringToTimestampForAPI(String strdate) {
		System.out.println("date format is yyyy-mm-dd+xxxxxxxx");
		System.out.println("Date : "+strdate);
		if(strdate==null||strdate.equals("")) {//날짜 정보 없는 경우
			return StringToTimestampSimple("0000-00-00");
		}
		strdate=strdate.substring(0, 10);
		return StringToTimestampSimple(strdate);
	}
	
	
}
