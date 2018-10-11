package com.aptidude.app.dto;

import java.sql.Array;
import java.util.ArrayList;

public class QuestionDTO {
	private String qstn;
	private Array options;
	private String answer;
	public String getQstn() {
		return qstn;
	}
	public void setQstn(String qstn) {
		this.qstn = qstn;
	}
	public Array getOptions() {
		return options;
	}
	public void setOptions(Array array) {
		this.options = array;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	
}
