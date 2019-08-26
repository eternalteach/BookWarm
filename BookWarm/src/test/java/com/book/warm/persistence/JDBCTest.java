package com.book.warm.persistence;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

import lombok.extern.log4j.Log4j;

// 테스트 실패시 (GB)
// 1. 빌드패스에 ojdbc8 추가하기.
// 2. 접속할 아이디 , 패스워드 확인하고 , sqldeveloper에  아이디 만들었나 확인해주세요.
// 3. 그 외 안되는경우는 caption warm or staff Caption warm 에게 문의주세요.

@Log4j
public class JDBCTest {
	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Test
	public void testConnection() {
		try (Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "book",
				"warm")) {
			log.info(con);
		} catch (Exception e) {
			fail(e.getMessage());
		}
	}
}
