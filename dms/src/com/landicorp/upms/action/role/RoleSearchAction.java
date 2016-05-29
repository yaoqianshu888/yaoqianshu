package com.landicorp.upms.action.role;

import com.landicorp.core.action.BaseActionSupport;
import com.landicorp.core.entities.Role;

public class RoleSearchAction extends BaseActionSupport
{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Role role;

	public String searchRole()
	{
		return SUCCESS;
	}
	public String getRoleDetail()
	{
		return "roleDetail";
	}
	public String roleTree()
	{
		return "roleTree";
	}

	public Role getRole()
	{
		return role;
	}
	public void setRole(Role role)
	{
		this.role = role;
	}
}
