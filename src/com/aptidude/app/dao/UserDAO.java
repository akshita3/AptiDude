package com.aptidude.app.dao;

import static com.aptidude.utils.CommonDAO.fetch_RoleID;
import static com.aptidude.utils.CommonDAO.fetch_UID;
import static com.aptidude.utils.CommonDAO.getConnection;
import static com.aptidude.utils.QueryConstants.DELETE_USER_SQL;
import static com.aptidude.utils.QueryConstants.LOGIN_SQL;
import static com.aptidude.utils.QueryConstants.REGISTER_USER_SQL;
import static com.aptidude.utils.QueryConstants.USER_ROLE_MAP_SQL;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.log4j.Logger;

import com.aptidude.app.dao.UserDAO;
import com.aptidude.app.dto.RightDTO;
import com.aptidude.app.dto.UserDTO;

public class UserDAO {
Logger logger = Logger.getLogger(UserDAO.class);
	
	public String doRegister(String rolename,String userid, String pwd, String emailid, String firstName, String lastName) throws ClassNotFoundException, SQLException {
		logger.debug("Inside UserDAO doRegister() method.");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			logger.debug("Connection created for REGISTER inside UserDAO..");
			pstmt = conn.prepareStatement(REGISTER_USER_SQL);
			pstmt.setString(1, userid);
			pstmt.setString(2, pwd);
			pstmt.setString(3, emailid);
			pstmt.setString(4, firstName);
			pstmt.setString(5, lastName);
			int noOfRecordsUpdated = pstmt.executeUpdate();
			if(noOfRecordsUpdated>0) {
				logger.debug("Record Added. Registration Successful.");
				int uid = fetch_UID(userid);
				int roleid = fetch_RoleID(rolename);
				
				if(uid == 0 || roleid == 0) {
					pstmt = conn.prepareStatement(DELETE_USER_SQL);
					pstmt.setString(1, userid);
					pstmt.executeUpdate();
					logger.debug("Error in User_Role_Mapping. Registration Rollbacked.");
					return "ERROR";
				}
				
				logger.debug("UID fetched: " + uid + "\tROLEID fetched: " + roleid);
				
				pstmt = conn.prepareStatement(USER_ROLE_MAP_SQL);
				pstmt.setInt(1, uid);
				pstmt.setInt(2, roleid);
				if(pstmt.executeUpdate()>0) {
					logger.debug("User_Role_Mapping SUCCESS.");
					return "SUCCESS";
				}
				else {
					logger.debug("User_Role_Mapping FAILED.");
					return "ERROR";
				}
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
	
	public UserDTO doLogin(String userid, String pwd) throws ClassNotFoundException, SQLException {
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
			pstmt.setString(1, userid);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			logger.debug("LOGIN Query executed.");
			while(rs.next()) {
				if(userDTO == null) {
					userDTO = new UserDTO();
					logger.debug("UserDTO Object created in loop.");
					userDTO.setUserid(rs.getString("USERID"));
					logger.debug("UserDTO Object setUserId().");
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
}
