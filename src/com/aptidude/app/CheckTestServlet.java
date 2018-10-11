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

import com.aptidude.app.dao.TestDAO;
import com.aptidude.app.dto.TestDTO;

@WebServlet("/checkTest")
public class CheckTestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Logger logger = Logger.getLogger(CheckTestServlet.class);
		HttpSession session = request.getSession(false);
		int qstnNo = (int)session.getAttribute("qstnNo");
		int totalCorrect = (int)session.getAttribute("totalCorrect");
		
		int points=-500;
		String ans = request.getParameter("option");
		System.out.println("chosen answer is: " + ans);
		TestDAO testDAO = new TestDAO();
		TestDTO testDTO = (TestDTO)session.getAttribute("qstnData");
		String emailid = (String)session.getAttribute("userid");
		
		if(ans.equals(testDTO.getQuestions().get(0).getAnswer())) {
			try {
				points = testDAO.addPoints(emailid);
				System.out.println("Points increased to: " + points);
				totalCorrect++;
				session.setAttribute("totalCorrect", totalCorrect);
			} 
			catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
		}
		else {
			try {
				points = testDAO.removePoints(emailid);
				System.out.println("Points decreased to: " + points);
			} 
			catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
		}
		session.setAttribute("points", points);
		qstnNo++;
		if(qstnNo<=5) {
			response.sendRedirect("takeTest" + qstnNo + ".jsp");
		}
		else {
			response.sendRedirect("testResult.jsp");
		}
	}

}
