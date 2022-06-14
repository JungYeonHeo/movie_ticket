package org.movie.DTO;

public class AnswerDTO {
	private String answer_id;
	private String question_id;
	private String answer_text;
	private String reg_date;
	private String writer;
	
	public AnswerDTO() {
	}

	public AnswerDTO(String answer_id, String question_id, String answer_text, String reg_date, String writer) {
		super();
		this.answer_id = answer_id;
		this.question_id = question_id;
		this.answer_text = answer_text;
		this.reg_date = reg_date;
		this.writer = writer;
	}

	public String getAnswer_id() {
		return answer_id;
	}

	public void setAnswer_id(String answer_id) {
		this.answer_id = answer_id;
	}

	public String getQuestion_id() {
		return question_id;
	}

	public void setQuestion_id(String question_id) {
		this.question_id = question_id;
	}

	public String getAnswer_text() {
		return answer_text;
	}

	public void setAnswer_text(String answer_text) {
		this.answer_text = answer_text;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	@Override
	public String toString() {
		return "AnswerDTO [answer_id=" + answer_id + ", question_id=" + question_id + ", answer_text=" + answer_text
				+ ", reg_date=" + reg_date + ", writer=" + writer + "]";
	}
	
}
