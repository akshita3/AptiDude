package com.aptidude.utils;

public interface QueryConstants {
	String COMMON_GENERIC_SQL = "SELECT * FROM COMMON_GENE_PARA WHERE KEY=?";
	
	String LOGIN_SQL = "SELECT USER_MST.USERID AS USERID,ROLE_MST.ROLENAME AS ROLE,RIGHT_MST.RIGHTNAME AS RIGHT,RIGHT_MST.SCREEN AS SCREEN "
			+ "FROM USER_MST,ROLE_MST,RIGHT_MST,USER_ROLE_MAPPING,ROLE_RIGHT_MAPPING "
			+ "WHERE USER_MST.UID=USER_ROLE_MAPPING.UID AND ROLE_MST.ROLEID=USER_ROLE_MAPPING.ROLEID "
			+ "AND ROLE_MST.ROLEID=ROLE_RIGHT_MAPPING.ROLEID AND RIGHT_MST.RIGHTID=ROLE_RIGHT_MAPPING.RIGHTID AND USER_MST.USERID=? AND USER_MST.PASSWORD=?;";
		//	returns userid, role, right, Screen.
	
	String REGISTER_USER_SQL = "INSERT INTO USER_MST (USERID,PASSWORD,EMAILID,FIRSTNAME,LASTNAME) values(?,?,?,?,?)";
	String UID_SQL = "SELECT UID FROM USER_MST WHERE USERID=?";
	String ROLEID_SQL = "SELECT ROLEID FROM ROLE_MST WHERE ROLENAME=?";
	String USER_ROLE_MAP_SQL = "INSERT INTO USER_ROLE_MAPPING(UID,ROLEID) VALUES(?,?)";
	String DELETE_USER_SQL = "DELETE FROM USER_MST WHERE USERID=?";
}
