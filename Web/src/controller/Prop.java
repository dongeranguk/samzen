package controller;

import javax.servlet.ServletConfig;
import javax.servlet.http.HttpServlet;

public class Prop extends HttpServlet{
	public static void main(String[] args) {
		public void init(ServletConfig config) throws ServletException {
			String prop = config.getInitParameter("configFile2");
			System.out.println(prop);
			Properties pr = new Properties();
			FileInputStream fis = null;
			try {
				String configFilePath = config.getServletContext().getRealPath(prop);
				System.out.println(configFilePath);
			}
		}
	}
}
