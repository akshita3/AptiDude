package com.aptidude.app.dto;

import java.util.ArrayList;

import com.aptidude.app.dto.RightDTO;

public class UserDTO {
	private String emailid;
	private String password;
	private String firstName;
	private String lastName;
	private String roleName;
	private ArrayList<RightDTO> rights;
	
	public String getEmailid() {
		return emailid;
	}
	public void setEmailid(String emailid) {
		this.emailid = emailid;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public ArrayList<RightDTO> getRights() {
		return rights;
	}
	public void setRights(ArrayList<RightDTO> rights) {
		this.rights = rights;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	
}
