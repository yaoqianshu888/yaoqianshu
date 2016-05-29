package com.landicorp.upms.action.checkstandversion;

import java.io.File;

import com.landicorp.core.action.BaseActionSupport;
import com.landicorp.core.entities.CheckstandVersion;

public class CheckstandVersionInsertAction extends BaseActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private CheckstandVersion checkstandVersion;
	private File upload;
	private String uploadFileName;

	public String prepare() {
		return INPUT;
	}

	public CheckstandVersion getCheckstandVersion() {
		return checkstandVersion;
	}

	public void setCheckstandVersion(CheckstandVersion checkstandVersion) {
		this.checkstandVersion = checkstandVersion;
	}

	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

}