package com.landicorp.upms.action.project;

import com.landicorp.core.action.BaseActionSupport;
import com.landicorp.core.entities.Project;

public class ProjectUpdateAction extends BaseActionSupport
{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Project project;

	public String prepare()
	{
		return INPUT;
	}
	public Project getProject()
	{
		return project;
	}
	public void setProject(Project project)
	{
		this.project = project;
	}
}
