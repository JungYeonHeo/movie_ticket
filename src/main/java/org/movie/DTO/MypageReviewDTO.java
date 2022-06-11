package org.movie.DTO;

public class MypageReviewDTO {

	private String title_ko;
	private String title_en;
	private String poster_img;
	private int g_rate_id;
	private String review_id;
	private double review_rate;
	private String review_text;
	private String write_time;
	private int recommend_count;
	
	public MypageReviewDTO() {
	}

	public MypageReviewDTO(String title_ko, String title_en, String poster_img, int g_rate_id,
			String review_id, double review_rate, String review_text, String write_time, int recommend_count) {
		super();
		this.title_ko = title_ko;
		this.title_en = title_en;
		this.poster_img = poster_img;
		this.g_rate_id = g_rate_id;
		this.review_id = review_id;
		this.review_rate = review_rate;
		this.review_text = review_text;
		this.write_time = write_time;
		this.recommend_count = recommend_count;
	}

	public String getTitle_ko() {
		return title_ko;
	}

	public void setTitle_ko(String title_ko) {
		this.title_ko = title_ko;
	}

	public String getTitle_en() {
		return title_en;
	}

	public void setTitle_en(String title_en) {
		this.title_en = title_en;
	}

	public String getPoster_img() {
		return poster_img;
	}

	public void setPoster_img(String poster_img) {
		this.poster_img = poster_img;
	}

	public int getG_rate_id() {
		return g_rate_id;
	}

	public void setG_rate_id(int g_rate_id) {
		this.g_rate_id = g_rate_id;
	}
	
	public String getReview_id() {
		return review_id;
	}
	
	public void setReview_id(String review_id) {
		this.review_id = review_id;
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
		return "MypageReviewDTO [review_id=" + review_id + ", title_ko=" + title_ko + ", title_en=" + title_en
				+ ", poster_img=" + poster_img + ", g_rate_id=" + g_rate_id + ", review_rate=" + review_rate
				+ ", review_text=" + review_text + ", write_time=" + write_time + ", recommend_count=" + recommend_count
				+ "]";
	}
	
}
