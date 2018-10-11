package com.aptidude.app;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.aptidude.app.dao.TestDAO;
import com.aptidude.app.dto.TestDTO;

@WebServlet("/test")
public class TestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Logger logger = Logger.getLogger(TestServlet.class);
		HttpSession session = request.getSession(false);
		session.setAttribute("points", 0);
		session.setAttribute("qstnNo", 1);
		session.setAttribute("totalCorrect", 0);
		
		String topic = request.getParameter("category");
		System.out.println("category is: " + topic);
		
		TestDAO testDAO = new TestDAO();
		
		try {
			TestDTO testDTO = testDAO.getTest(topic);
			if(testDTO != null) {
				session.setAttribute("qstnData", testDTO);
				response.sendRedirect("takeTest.jsp");
			}
			else {
				logger.debug("Error in category.");
				response.sendRedirect("takeTestIntro.jsp");
			}
		} 
		catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
	}

}
