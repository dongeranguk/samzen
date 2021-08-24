package controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.CommandAction;
import action.NullAction;

public class ControllerUsingURI2 extends HttpServlet{

	private Map commandMap = new HashMap();//명령어와 명령어 처리클래스를 쌍으로 저장
	
	
	//명령어와 처리클래스가 매핑되어 있는 properties 파일을 읽어서 Map객체인 commandMap에 저장
	//명령어와 처리클래스가 매핑되어 있는 properties 파일은 Command.properties파일
	public void init(ServletConfig config) throws ServletException {
		String props = config.getInitParameter("configFile2"); // web.xml에서 propertyConfig에 해당하는 init-param의 값을 읽어옴
		Properties pr = new Properties(); // 명령어와 처리클래스의 매핑정보를 저장할 Properties 객체 생성
		FileInputStream fis = null;
		try {
			String configFilePath = config.getServletContext().getRealPath(props);
			
			fis = new FileInputStream(configFilePath); //Command.properties파일의 내용을 읽어옴
			
			pr.load(fis); // Command.properties파일의 정보를 Properties객체에 저장
		}catch(IOException e) {
			throw new ServletException(e);
		}finally {
			if(fis != null) try {fis.close();} catch(IOException e) {}
		}
		Iterator keyIter = pr.keySet().iterator(); // Iterator객체는 Enumaration객체를 확장시킨 개념의 객체
		while(keyIter.hasNext()) {
			String command = (String)keyIter.next();
			String className = pr.getProperty(command);
			try {
				Class commandClass = Class.forName(className);
				Object commandInstance = commandClass.newInstance();
				commandMap.put(command, commandInstance);
			}catch(ClassNotFoundException e) {
				throw new ServletException(e);
			}catch(InstantiationException e) {
				throw new ServletException(e);
			}catch(IllegalAccessException e) {
				throw new ServletException(e);
			}
		}
	}
	
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response)
	throws ServletException, IOException {
		requestPro(request, response);
	}
	
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response)
	throws ServletException, IOException {
		requestPro(request, response);
	}
	
	private void requestPro(HttpServletRequest request,
			HttpServletResponse response)
	throws ServletException, IOException {
		String view = null;
		CommandAction com = null;
		try {
			String command = request.getRequestURI();
			if(command.indexOf(request.getContextPath()) == 0) {
				command = command.substring(request.getContextPath().length());
			}
			com = (CommandAction)commandMap.get(command);
				if(com == null) {
					com = new NullAction();
				}
			view = com.requestPro(request, response);
		}catch(Throwable e) {
			throw new ServletException(e);
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);
	}
}
