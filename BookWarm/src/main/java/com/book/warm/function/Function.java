package com.book.warm.function;

import java.sql.Timestamp;

public class Function {
	public static Timestamp StringToTimestamp(String strdate) {
		strdate += " 00:00:00";
		Timestamp timeStamp = Timestamp.valueOf(strdate);
		return timeStamp;
	}
}
