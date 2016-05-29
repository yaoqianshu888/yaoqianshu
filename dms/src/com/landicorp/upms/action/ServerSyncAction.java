package com.landicorp.upms.action;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.net.URL;
import java.net.URLConnection;

import javax.servlet.ServletContext;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.landicorp.core.action.BaseActionSupport;
import com.landicorp.core.helper.sysinit.ISysInitTask;
import com.landicorp.core.util.StringUtil;
import com.landicorp.core.web.option.Constants;

public class ServerSyncAction extends BaseActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private final static Logger logger = Logger.getLogger(ServerSyncAction.class);
	private String taskName;
	public String basePath;
	public String saveUrl;
	public String newFileName;

	public void sync() throws Exception {
		ServletContext servletContext = ServletActionContext.getServletContext();
		WebApplicationContext springContext = WebApplicationContextUtils.getWebApplicationContext(servletContext);
		if (StringUtil.isEmpty(taskName)) {
			logger.error("Reload initTask failure with incorrect bean name: " + taskName);
			return;
		}
		Object object = springContext.getBean(taskName);
		if (object == null) {
			logger.error("Reload initTask failure with can't found task named: " + taskName);
			return;
		}
		if (!(object instanceof ISysInitTask)) {
			logger.error("Reload initTask failure with incorrect task type named: " + taskName);
			return;
		}
		ISysInitTask initTask = (ISysInitTask) object;
		if (initTask.onSysInit(servletContext, springContext) != Constants.SUCCESS) {
			logger.error("Reload initTask failure by: " + taskName);
			return;
		}
		logger.info("Reload initTask success by: " + taskName);
	}

	public void downFile() throws Exception {
		String url = basePath + saveUrl + newFileName;
		String filePath = getRealPath("/") + saveUrl;
		URL theURL = new URL(url);
		URLConnection con = theURL.openConnection();
		if (newFileName != null) {
			byte[] buffer = new byte[4 * 1024];
			int read;
			File fileFolder = new File(filePath);
			if (!fileFolder.exists()) {
				fileFolder.mkdirs();
			}
			InputStream in = con.getInputStream();
			String path = filePath + "/" + newFileName;
			FileOutputStream os = new FileOutputStream(path);
			while ((read = in.read(buffer)) > 0) {
				os.write(buffer, 0, read);
			}
			os.close();
			in.close();
		}
	}

	public String getBasePath() {
		return basePath;
	}

	public void setBasePath(String basePath) {
		this.basePath = basePath;
	}

	public String getSaveUrl() {
		return saveUrl;
	}

	public void setSaveUrl(String saveUrl) {
		this.saveUrl = saveUrl;
	}

	public String getNewFileName() {
		return newFileName;
	}

	public void setNewFileName(String newFileName) {
		this.newFileName = newFileName;
	}

	public String getTaskName() {
		return taskName;
	}

	public void setTaskName(String taskName) {
		this.taskName = taskName;
	}

}
