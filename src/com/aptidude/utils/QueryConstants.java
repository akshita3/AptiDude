package com.aptidude.utils;

public interface QueryConstants {
	String COMMON_GENERIC_SQL = "SELECT * FROM COMMON_GENE_PARA WHERE KEY=?";
	
	String LOGIN_SQL = "SELECT USER_MST.EMAILID AS EMAILID,USER_MST.PASSWORD AS PASSWORD,USER_MST.FIRSTNAME AS FIRSTNAME,USER_MST.LASTNAME AS LASTNAME,ROLE_MST.ROLENAME AS ROLE,RIGHT_MST.RIGHTNAME AS RIGHT,RIGHT_MST.SCREENNAME AS SCREEN "
			+ "FROM USER_MST,ROLE_MST,RIGHT_MST,ROLE_RIGHT_MAPPING "
			+ "WHERE USER_MST.ROLEID=ROLE_MST.ROLEID "
			+ "AND ROLE_MST.ROLEID=ROLE_RIGHT_MAPPING.ROLEID AND RIGHT_MST.RIGHTID=ROLE_RIGHT_MAPPING.RIGHTID AND USER_MST.EMAILID=? AND USER_MST.PASSWORD=?;";
		//	returns emailid, role, right, Screen.
	
	String REGISTER_USER_SQL = "INSERT INTO USER_MST (EMAILID,PASSWORD,FIRSTNAME,LASTNAME,ROLEID) values(?,?,?,?,?)";
	String UPDATE_USER_SQL = "UPDATE USER_MST SET PASSWORD=?, FIRSTNAME=?,LASTNAME=? WHERE EMAILID=?";
	String UID_SQL = "SELECT UID FROM USER_MST WHERE EMAILID=?";
	String ROLEID_SQL = "SELECT ROLEID FROM ROLE_MST WHERE ROLENAME=?";
	String DELETE_USER_SQL = "DELETE FROM USER_MST WHERE EMAILID=?";
	
	String QUESTIONS_SQL = "select qstn,options,answer,topicname from qstn_mst,topic_mst where topic_mst.topicname=? and topic_mst.topicid=qstn_mst.topicid;";
	
	String GET_POINTS_SQL = "select points from user_mst where emailid=?;";
	String PUT_POINTS_SQL = "update user_mst set points=? where emailid=?;";
}
