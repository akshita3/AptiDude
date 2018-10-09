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

/**
 * Servlet implementation class updateProfileServlet
 */
@WebServlet("/updateProfile")
public class updateProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	Logger logger = Logger.getLogger(updateProfileServlet.class);
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger.debug("Inside updateProfileServlet doPost() method."); 
		
		String oldPassword =request.getParameter("oldpassword");
		String newPassword = request.getParameter("newpassword");
		String firstName = request.getParameter("firstname");
		String lastName = request.getParameter("lastname");
		
		HttpSession session = request.getSession(false);
		UserDTO userDTO = (UserDTO)session.getAttribute("userdata");
		
		if(!userDTO.getPassword().equals(oldPassword)) {
			response.sendRedirect("updateProfileError.jsp");
		}
		else {
			String emailid = userDTO.getEmailid();
			UserDAO userDAO = new UserDAO();
			try {
				String message = userDAO.doUpdate(emailid,newPassword,firstName,lastName);
				if(message == "SUCCESS") {
					userDTO.setPassword(newPassword);
					userDTO.setFirstName(firstName);
					userDTO.setLastName(lastName);
					session.setAttribute("userdata", userDTO);
					response.sendRedirect("updateProfileSuccess.jsp");
				}
				else {
					response.sendRedirect("updateProfileError.jsp");
				}
			} 
			catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
		}	
	}

}
