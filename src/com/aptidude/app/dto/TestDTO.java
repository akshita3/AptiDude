package com.aptidude.app.dto;

import java.util.ArrayList;

public class TestDTO {
	private String topic;
	private ArrayList<QuestionDTO> questions;
	public String getTopic() {
		return topic;
	}
	public void setTopic(String topic) {
		this.topic = topic;
	}
	public ArrayList<QuestionDTO> getQuestions() {
		return questions;
	}
	public void setQuestions(ArrayList<QuestionDTO> questions) {
		this.questions = questions;
	}
	
}
