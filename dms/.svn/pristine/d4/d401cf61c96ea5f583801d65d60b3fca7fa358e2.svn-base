package com.landicorp.upms.action.checkstandversion;

import java.io.FileInputStream;

import org.dom4j.DocumentException;

import com.landicorp.core.action.BaseActionSupport;

public class VersionUpdateAction extends BaseActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String fileName;
	private String fileContentType;
	private FileInputStream inputStream;
	private Integer id;
	private String contentLength;

	public String getDownloadFile() throws DocumentException {
		return "downFile";
	}

	public String getFileName() {
		return fileName;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}

	public String getFileContentType() {
		return fileContentType;
	}

	public void setInputStream(FileInputStream inputStream) {
		this.inputStream = inputStream;
	}

	public FileInputStream getInputStream() {
		return inputStream;
	}

	public String getContentLength() {
		return contentLength;
	}

	public void setContentLength(String contentLength) {
		this.contentLength = contentLength;
	}

}