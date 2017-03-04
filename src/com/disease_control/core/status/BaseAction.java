package com.disease_control.core.status;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONSerializer;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.yakov.utils.BeanUtils;
import com.yakov.utils.GenericsUtils;
import com.yakov.utils.JsonUtil;

public abstract class BaseAction<Form> extends ActionSupport implements ModelDriven {
	
	protected Class<Form> entityForm; // Form
	protected Form form; // Form对象
	protected HttpServletRequest request;
	protected HttpSession session;
	protected ActionContext context;
	protected HttpServletResponse response;

	public BaseAction() {
		init();
	}

	@Override
	public Object getModel() {
		return form;
	}

	public Form getForm() {
		return form;
	}

	public void setForm(Form form) {
		this.form = form;
	}

	/**
	 * 
	 * @param owner
	 * @param fieldName
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	private void init() {
		try {
			entityForm = GenericsUtils.getSuperClassGenricType(getClass());
			form = getMInit(entityForm);
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		}
	}

	public Class<Form> getEntityForm() {
		return entityForm;
	}

	public void setEntityForm(Class<Form> entityForm) {
		this.entityForm = entityForm;
	}

	protected Form getMInit(Class<Form> entityForm) throws InstantiationException, IllegalAccessException {
		return entityForm.newInstance();
	}

	/**
	 * 初始化Request，Response，Session并设置字符编码
	 */
	protected void initRequest() {
		request = ServletActionContext.getRequest();
		response = ServletActionContext.getResponse();
		context = ActionContext.getContext();
		session = request.getSession();
		response.setCharacterEncoding("utf-8");
		response.setHeader("charset", "utf-8");
		response.setContentType("text/html; charset=utf-8");
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}

	public String getContextPath() {
		return request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
	}

	public String getLastPath() {
		return ServletActionContext.getRequest().getHeader("REFERER");
	}

	protected ServletContext getServletContext() {
		return ServletActionContext.getServletContext();
	}

	public PrintWriter getPrintWriter() {
		try {
			return ServletActionContext.getResponse().getWriter();
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
	}

}
