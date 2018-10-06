package com.aptidude.app;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	Logger logger = Logger.getLogger(LoginServlet.class);
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger.debug("Inside LoginServlet doPost() method.");
		
		String userid = request.getParameter("userid");
		String pwd = request.getParameter("pwd");
		logger.debug("LoginServlet doPost() received credentials.");
		
		UserDAO userDAO = new UserDAO();
		
		try {
			
		}
		catch() {
			
		}
	}

}
