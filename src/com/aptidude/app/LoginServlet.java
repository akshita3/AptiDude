package com.aptidude.app;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.aptidude.app.dao.UserDAO;
import com.aptidude.app.dto.UserDTO;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	Logger logger = Logger.getLogger(LoginServlet.class);
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger.debug("Inside LoginServlet doPost() method.");
		
		String emailid = request.getParameter("emailid");
		String password = request.getParameter("password");
		logger.debug("LoginServlet doPost() received credentials.");
		
		UserDAO userDAO = new UserDAO();
		
		try {
			UserDTO userDTO = userDAO.doLogin(emailid,password);
			logger.debug("LoginServlet received db-loaded UserDTO Object: " + userDTO);
			if(userDTO != null) {
				HttpSession session = request.getSession(true);
				logger.debug("HttpSession created.");
				logger.debug("Session ID: " + session.getId());
				logger.debug("Session Created at: " + session.getCreationTime());
				session.setAttribute("firstName", userDTO.getFirstName());
				session.setAttribute("userid", userDTO.getEmailid());
				session.setAttribute("userdata", userDTO);
				logger.debug("Redirecting to Dashboard.jsp...");
				response.sendRedirect("Dashboard.jsp");
			
			}
			else {
				logger.debug("Error in Login.");
				response.sendRedirect("loginError.jsp");
			}
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
			
	}
	
}

