package com.disease_control.web.action.upload;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.URL;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;

import com.disease_control.core.status.BaseAction;
import com.disease_control.core.status.BaseForm;
import com.yakov.utils.EmailHttpXmlClient;

public class XhediterUpload extends BaseAction<BaseForm> {

	private static final long serialVersionUID = 1L;

	public static String rootPathImg;
	public static String rootPathFile;

	static {
		try {
			Properties emailProperties = new Properties();
			URL url = EmailHttpXmlClient.class.getClassLoader().getResource("xhrUpload.properties");
			emailProperties.load(new FileInputStream(url.getFile().replaceAll("%20", " ")));
			rootPathImg = emailProperties.getProperty("rootPathImg");
			rootPathFile = emailProperties.getProperty("rootPathFile");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static DateFormat format = new SimpleDateFormat("yyyy" + File.separator + "MM" + File.separator + "dd");

	/**
	 * 上传图片
	 */
	public void imgUpload() throws Exception {
		this.initRequest();
		this.upload(rootPathImg, "imgUpload", request, response);
	}

	/**
	 * 上传附件
	 */
	public void fileUpload() throws Exception {
		this.initRequest();
		this.upload(rootPathFile, "fileUpload", request, response);
	}

	public void upload(String rootPath, String uploadType, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		if ("application/octet-stream".equals(request.getHeader("Content-Type"))) {
			String CDHeader = request.getHeader("Content-Disposition");
			if (StringUtils.isNotEmpty(CDHeader)) {
				String[] headers = CDHeader.split(";");
				if (headers != null && headers.length == 3) {
					String fileName = headers[2].replaceAll("\"", "").split("=")[1];
					String fileExt = "";
					String[] tmps = fileName.split("\\.");
					if (tmps.length > 0)
						fileExt = tmps[tmps.length - 1];
					InputStream inputStream = request.getInputStream();
					String filePath = File.separator + format.format(new Date()) + File.separator + System.currentTimeMillis() + "." + fileExt;
					File file = new File(rootPath + filePath);
					if (!file.getParentFile().exists()) {
						file.getParentFile().mkdirs();
					}
					if (!file.exists()) {
						file.createNewFile();
					}
					FileOutputStream outputStream = new FileOutputStream(file);
					byte[] bt = new byte[2048];
					int len = -1;
					while ((len = inputStream.read(bt)) != -1) {
						outputStream.write(bt, 0, len);
					}
					outputStream.flush();
					outputStream.close();
					response.setCharacterEncoding("UTF-8");
					PrintWriter out = response.getWriter();
					if ("fileUpload".equals(uploadType)) {
						String msg = "{err:'',msg:'\\/file\\/" + uploadType + filePath.replace("\\", "\\/") + "||" + fileName + "||" + fileExt + "'}";
						out.write(msg);
					} else {
						String msg = "{err:'',msg:'!\\/file\\/" + uploadType + filePath.replace("\\", "\\/") + "'}";
						out.write(msg);
					}
					out.flush();
					out.close();
				}
			}
		}
	}
}
