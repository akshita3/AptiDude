package com.aptidude.app.dao;

import static com.aptidude.utils.CommonDAO.fetch_RoleID;
import static com.aptidude.utils.CommonDAO.getConnection;
import static com.aptidude.utils.QueryConstants.LOGIN_SQL;
import static com.aptidude.utils.QueryConstants.REGISTER_USER_SQL;
import static com.aptidude.utils.QueryConstants.UPDATE_USER_SQL;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.log4j.Logger;

import com.aptidude.app.dto.RightDTO;
import com.aptidude.app.dto.UserDTO;
import com.aptidude.utils.QueryConstants;

public class UserDAO {
Logger logger = Logger.getLogger(UserDAO.class);
	
	public String doRegister(String rolename,String emailid, String password, String firstName, String lastName) throws ClassNotFoundException, SQLException {
		logger.debug("Inside UserDAO doRegister() method.");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			logger.debug("Connection created for REGISTER inside UserDAO..");
			int roleid = fetch_RoleID(rolename);
			pstmt = conn.prepareStatement(REGISTER_USER_SQL);
			pstmt.setString(1, emailid);
			pstmt.setString(2, password);
			pstmt.setString(3, firstName);
			pstmt.setString(4, lastName);
			pstmt.setInt(5, roleid);
			int noOfRecordsUpdated = pstmt.executeUpdate();
			if(noOfRecordsUpdated>0) {
				logger.debug("Record Added. Registration Successful.");
				return "SUCCESS";
			}
			else {
				logger.debug("Record Not Added. Registration Failed.");
				return "ERROR";
			}	
		}
		finally {
			if(pstmt!=null) {
				pstmt.close();
			}
			if(conn!=null) {
				conn.close();
			}
			logger.debug("Resources closed for REGISTER in UserDAO.");
		}
		
	}
	
	public UserDTO doLogin(String emailid, String password) throws ClassNotFoundException, SQLException {
		logger.debug("Inside UserDAO doLogin() method.");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<RightDTO> rights = null;
		UserDTO userDTO = null;
		
		try {
			conn = getConnection();
			logger.debug("Connection created for LOGIN inside UserDAO.");
			pstmt = conn.prepareStatement(LOGIN_SQL);
			pstmt.setString(1, emailid);
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();
			logger.debug("LOGIN Query executed.");
			while(rs.next()) {
				if(userDTO == null) {
					userDTO = new UserDTO();
					logger.debug("UserDTO Object created in loop.");
					userDTO.setEmailid(rs.getString("EMAILID"));
					logger.debug("UserDTO Object setEmailId().");
					userDTO.setPassword(rs.getString("PASSWORD"));
					logger.debug("UserDTO Object setPassword().");
					userDTO.setFirstName(rs.getString("FIRSTNAME"));
					logger.debug("UserDTO Object setFirstName().");
					userDTO.setLastName(rs.getString("LASTNAME"));
					logger.debug("UserDTO Object setLastName().");
					userDTO.setRoleName(rs.getString("ROLE"));
					logger.debug("UserDTO Object setRoleName().");
					rights = new ArrayList<>();
					userDTO.setRights(rights);
				}
				RightDTO right = new RightDTO();
				right.setRightName(rs.getString("RIGHT"));
				logger.debug("UserDTO Object setRightName().");
				right.setScreenName(rs.getString("SCREEN"));
				logger.debug("UserDTO Object setScreenName().");
				rights.add(right);
				logger.debug("UserDTO Object Right added to AList<>.");
			}
			logger.debug("Returning db-loaded UserDTO object: " + userDTO);
			return userDTO;
		}
		finally {
			if(rs!=null) {
				rs.close();
			}
			if(pstmt!=null) {
				pstmt.close();
			}
			if(conn!=null) {
				conn.close();
			}
			logger.debug("Resources closed for LOGIN in UserDAO.");
		}
	}

	public String doUpdate(String emailid,String newPassword, String firstName, String lastName) throws ClassNotFoundException, SQLException {
		logger.debug("Inside UserDAO doUpdate() method.");
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			logger.debug("Connection created for UPDATE inside UserDAO..");
			pstmt = conn.prepareStatement(UPDATE_USER_SQL);
			pstmt.setString(1, newPassword);
			pstmt.setString(2, firstName);
			pstmt.setString(3, lastName);
			pstmt.setString(4, emailid);
			int noOfRecordsUpdated = pstmt.executeUpdate();
			if(noOfRecordsUpdated>0) {
				logger.debug("Record Updated. Profile Update Successful.");
				return "SUCCESS";
			}
			else {
				logger.debug("Record Not Updated. Profile Update Failed.");
				return "ERROR";
			}	
		}
		catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			return "ERROR";
		}
		finally {
			if(pstmt!=null) {
				pstmt.close();
			}
			if(conn!=null) {
				conn.close();
			}
			logger.debug("Resources closed for UPDATE in UserDAO.");
		}
	}
}
