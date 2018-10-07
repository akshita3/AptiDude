package com.aptidude.app;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.aptidude.app.dao.UserDAO;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    Logger logger = Logger.getLogger(RegisterServlet.class);
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger.debug("Inside RegisterServlet doPost() method.");
		PrintWriter out = response.getWriter();
		String rolename = "User";
		String userid = request.getParameter("userid");
		String emailid = request.getParameter("emailid");
		String pwd = request.getParameter("password");
		String firstName = request.getParameter("firstname");
		String lastName = request.getParameter("lastname");
		logger.debug("RegisterServlet doPost() received credentials.");
		
		UserDAO userDAO = new UserDAO();
		
		try {
			String message = userDAO.doRegister(rolename,userid, pwd, emailid, firstName, lastName);
			if(message == "SUCCESS") {
				response.sendRedirect("registerSuccess.jsp");
			}
			else {
				response.sendRedirect("registerError.jsp");
			}
			
			
		} catch (ClassNotFoundException e) { 
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			out.close();
		}
	}

}
