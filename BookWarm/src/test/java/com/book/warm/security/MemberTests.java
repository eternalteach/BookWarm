package com.book.warm.security;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
							"file:src/main/webapp/WEB-INF/spring/security-context.xml"
})
@Log4j
public class MemberTests {
	
	@Inject
	private PasswordEncoder pwencoder;
	
	@Inject
	private DataSource ds;
	
//	@Test
	public void testInsertMember() {
		
		String sql = "insert into user_info(user_id, user_pw, user_nickname, user_name, user_bday, user_sex, user_phone, "
				+ "user_mail, user_zipcode, user_addr,user_join_date, user_tot_price, user_point, enabled) "
				+ "values(?,?,?,?,TO_DATE('1994-12-31'),'f', '010-1231-1231', ?, 12345, '서울특별시 영등포구 양평동1가', sysdate, 0,0, 1)";
		
		for(int i=0; i<10; i++) {
			
			Connection con = null;
			PreparedStatement pstmt = null;
			
			try {
				
				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(2,  pwencoder.encode("pw" + i));
				
				if(i<8) {
					
					pstmt.setString(1,  "user" + i);
					pstmt.setString(3,  "일반닉네임" + i);
					pstmt.setString(4,  "일반사용자" + i);
					pstmt.setString(5,  "user" + i + "@naver.com");
				} else if (i<9) {

					pstmt.setString(1,  "manager" + i);
					pstmt.setString(3,  "운영자닉네임" + i);
					pstmt.setString(4,  "운영자" + i);
					pstmt.setString(5,  "manager" + i + "@naver.com");
				} else {

					pstmt.setString(1,  "admin" + i);
					pstmt.setString(3,  "관리자닉네임" + i);	
					pstmt.setString(4,  "관리자" + i);
					pstmt.setString(5,  "admin" + i + "@naver.com");
				}
				
				pstmt.executeUpdate();
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				
				if(pstmt != null) { try {  pstmt.close(); } catch(Exception e) {} }
				if(con != null) { try {  con.close(); } catch(Exception e) {} }
			}
		} // end for
	} // end testInsertMember
	
	@Test
	public void testInsertAuth() {
		
		String sql = "insert into authorities (user_id, authority) values(?,?)";
		
		for(int i=0; i<10; i++) {
			
			Connection con = null;
			PreparedStatement pstmt = null;
			
			try {
				
				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);
				
				if(i<8) {
					
					pstmt.setString(1,  "user" + i);
					pstmt.setString(2,  "ROLE_USER" );
				} else if (i<9) {

					pstmt.setString(1,  "manager" + i);
					pstmt.setString(2,  "ROLE_MEMBER");
				} else {

					pstmt.setString(1,  "admin" + i);
					pstmt.setString(2,  "ROLE_ADMIN");	
				}
				
				pstmt.executeUpdate();
				
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				
				if(pstmt != null) { try {  pstmt.close(); } catch(Exception e) {} }
				if(con != null) { try {  con.close(); } catch(Exception e) {} }
			}
		} // end for
	}
}
