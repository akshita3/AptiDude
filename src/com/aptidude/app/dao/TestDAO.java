package com.aptidude.app.dao;

import static com.aptidude.utils.CommonDAO.getConnection;
import static com.aptidude.utils.QueryConstants.QUESTIONS_SQL;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.log4j.Logger;

import com.aptidude.app.dto.QuestionDTO;
import com.aptidude.app.dto.TestDTO;
import com.aptidude.utils.QueryConstants;

public class TestDAO {
	Logger logger = Logger.getLogger(TestDAO.class);
	
	public TestDTO getTest(String topic) throws ClassNotFoundException, SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<QuestionDTO> questions = null;
		TestDTO testDTO = null;
	
		conn = getConnection();
		pstmt = conn.prepareStatement(QUESTIONS_SQL);
		pstmt.setString(1, topic);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			if(testDTO == null) {
				testDTO = new TestDTO();
				logger.debug("TestDTO Object created in loop.");
				testDTO.setTopic(rs.getString("topicname"));
				logger.debug("topicname: " + testDTO.getTopic());
				questions = new ArrayList<>();
				testDTO.setQuestions(questions);
			}
			QuestionDTO question = new QuestionDTO();
			question.setQstn(rs.getString("qstn"));
			logger.debug("qstn: " + question.getQstn());
			question.setAnswer(rs.getString("answer"));
			logger.debug("answer: " + question.getAnswer());
			question.setOptions(rs.getArray("options"));
			logger.debug("options: " + question.getOptions());
			questions.add(question);
		}
		return testDTO;
	}
	
	public int addPoints(String emailid) throws ClassNotFoundException, SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int points=0;
		
		conn = getConnection();
		pstmt = conn.prepareStatement(QueryConstants.GET_POINTS_SQL);
		pstmt.setString(1, emailid);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			points = rs.getInt("points");
		}
		points += 3;
		pstmt = conn.prepareStatement(QueryConstants.PUT_POINTS_SQL);
		pstmt.setInt(1, points);
		pstmt.setString(2, emailid);
		int noOfRecordsUpdated = pstmt.executeUpdate();
		if(noOfRecordsUpdated>0) {
			return points;
		}
		else {
			return -500;
		}
		
	}
	
	public int removePoints(String emailid) throws ClassNotFoundException, SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int points=0;
		
		conn = getConnection();
		pstmt = conn.prepareStatement(QueryConstants.GET_POINTS_SQL);
		pstmt.setString(1, emailid);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			points = rs.getInt("points");
		}
		points -= 1;
		pstmt = conn.prepareStatement(QueryConstants.PUT_POINTS_SQL);
		pstmt.setInt(1, points);
		pstmt.setString(2, emailid);
		int noOfRecordsUpdated = pstmt.executeUpdate();
		if(noOfRecordsUpdated>0) {
			return points;
		}
		else {
			return -500;
		}
	}
	
	public int resetPoints(String emailid) throws ClassNotFoundException, SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int points=0;
		
		conn = getConnection();
		pstmt = conn.prepareStatement(QueryConstants.GET_POINTS_SQL);
		pstmt.setString(1, emailid);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			points = rs.getInt("points");
		}
		points = 0;
		pstmt = conn.prepareStatement(QueryConstants.PUT_POINTS_SQL);
		pstmt.setInt(1, points);
		pstmt.setString(2, emailid);
		int noOfRecordsUpdated = pstmt.executeUpdate();
		if(noOfRecordsUpdated>0) {
			return points;
		}
		else {
			return -500;
		}
		
	}
}
