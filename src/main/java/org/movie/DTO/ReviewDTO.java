package org.movie.DTO;

public class ReviewDTO {

	private String review_id;
	private String member_id;
	private String movie_id;
	private double review_rate;
	private String review_text;
	private String write_time;
	private int recommend_count;
	
	public ReviewDTO() {
	}

	public ReviewDTO(String review_id, String member_id, String movie_id, double review_rate, String review_text,
			String write_time, int recommend_count) {
		super();
		this.review_id = review_id;
		this.member_id = member_id;
		this.movie_id = movie_id;
		this.review_rate = review_rate;
		this.review_text = review_text;
		this.write_time = write_time;
		this.recommend_count = recommend_count;
	}

	public String getReview_id() {
		return review_id;
	}

	public void setReview_id(String review_id) {
		this.review_id = review_id;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMovie_id() {
		return movie_id;
	}

	public void setMovie_id(String movie_id) {
		this.movie_id = movie_id;
	}

	public double getReview_rate() {
		return review_rate;
	}

	public void setReview_rate(double review_rate) {
		this.review_rate = review_rate;
	}

	public String getReview_text() {
		return review_text;
	}

	public void setReview_text(String review_text) {
		this.review_text = review_text;
	}

	public String getWrite_time() {
		return write_time;
	}

	public void setWrite_time(String write_time) {
		this.write_time = write_time;
	}

	public int getRecommend_count() {
		return recommend_count;
	}

	public void setRecommend_count(int recommend_count) {
		this.recommend_count = recommend_count;
	}

	@Override
	public String toString() {
		return "ReviewDTO [review_id=" + review_id + ", member_id=" + member_id + ", movie_id=" + movie_id
				+ ", review_rate=" + review_rate + ", review_text=" + review_text + ", write_time=" + write_time
				+ ", recommend_count=" + recommend_count + "]";
	}

}
