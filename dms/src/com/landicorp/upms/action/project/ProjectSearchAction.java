package com.landicorp.upms.action.project;

import java.util.List;

import com.landicorp.core.action.BaseActionSupport;
import com.landicorp.core.entities.Project;

public class ProjectSearchAction extends BaseActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Project project;
	private List<Project> projectList;

	public String searchProject() {
		return SUCCESS;
	}

	public String detail() {
		return "detail";
	}

	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	public List<Project> getProjectList() {
		return projectList;
	}

	public void setProjectList(List<Project> projectList) {
		this.projectList = projectList;
	}

}
