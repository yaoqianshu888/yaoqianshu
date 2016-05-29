package com.landicorp.upms.action.user;

import com.landicorp.core.entities.User;

public interface LoginOperation {
	public User handle(User user) throws Exception;
}
