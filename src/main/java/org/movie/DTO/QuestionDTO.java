package org.movie.DTO;

import java.util.Date;

public class QuestionDTO {
	private String question_id;
	private String member_id;
	private String question_type;
	private String question_title;
	private String question_text;
	private String reg_date;
	private String answer_state; 
	
	public QuestionDTO() {
	}

	public QuestionDTO(String question_id, String member_id, String question_type, String question_title,
			String question_text, String reg_date, String answer_state) {
		super();
		this.question_id = question_id;
		this.member_id = member_id;
		this.question_type = question_type;
		this.question_title = question_title;
		this.question_text = question_text;
		this.reg_date = reg_date;
		this.answer_state = answer_state;
	}

	public String getQuestion_id() {
		return question_id;
	}

	public void setQuestion_id(String question_id) {
		this.question_id = question_id;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getQuestion_type() {
		return question_type;
	}

	public void setQuestion_type(String question_type) {
		this.question_type = question_type;
	}

	public String getQuestion_title() {
		return question_title;
	}

	public void setQuestion_title(String question_title) {
		this.question_title = question_title;
	}

	public String getQuestion_text() {
		return question_text;
	}

	public void setQuestion_text(String question_text) {
		this.question_text = question_text;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	public String getAnswer_state() {
		return answer_state;
	}

	public void setAnswer_state(String answer_state) {
		this.answer_state = answer_state;
	}

	@Override
	public String toString() {
		return "QuestionDTO [question_id=" + question_id + ", member_id=" + member_id + ", question_type="
				+ question_type + ", question_title=" + question_title + ", question_text=" + question_text
				+ ", reg_date=" + reg_date + ", answer_state=" + answer_state + "]";
	}

}
