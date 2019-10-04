package com.book.warm.mapper;

public interface AuthenticationMapper {

	public int removeAllAuthentication(String user_id);

	public int addAuthenticationRoleUser(String user_id);

	public int addAuthenticationRoleManager(String user_id);

	public int addAuthenticationRoleAdmin(String user_id);

}
