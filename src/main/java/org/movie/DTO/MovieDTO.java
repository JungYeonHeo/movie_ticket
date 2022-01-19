package org.movie.DTO;

public class MovieDTO {

	private String movie_id;
	private String title_ko;
	private String title_en;
	private String poster_img;
	private int g_rate_id;
	private String time;
	private String distributor;
	private String story;
	private String trailer;
	private String opening_date;
	private String closing_date;
	private double gen_avg_rate;
	
	public MovieDTO() {
	}

	public MovieDTO(String movie_id, String title_ko, String title_en, String poster_img, int g_rate_id, String time,
			String distributor, String story, String trailer, String opening_date, String closing_date,
			double gen_avg_rate) {
		super();
		this.movie_id = movie_id;
		this.title_ko = title_ko;
		this.title_en = title_en;
		this.poster_img = poster_img;
		this.g_rate_id = g_rate_id;
		this.time = time;
		this.distributor = distributor;
		this.story = story;
		this.trailer = trailer;
		this.opening_date = opening_date;
		this.closing_date = closing_date;
		this.gen_avg_rate = gen_avg_rate;
	}

	public String getMovie_id() {
		return movie_id;
	}

	public void setMovie_id(String movie_id) {
		this.movie_id = movie_id;
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

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getDistributor() {
		return distributor;
	}

	public void setDistributor(String distributor) {
		this.distributor = distributor;
	}

	public String getStory() {
		return story;
	}

	public void setStory(String story) {
		this.story = story;
	}

	public String getTrailer() {
		return trailer;
	}

	public void setTrailer(String trailer) {
		this.trailer = trailer;
	}

	public String getOpening_date() {
		return opening_date;
	}

	public void setOpening_date(String opening_date) {
		this.opening_date = opening_date;
	}

	public String getClosing_date() {
		return closing_date;
	}

	public void setClosing_date(String closing_date) {
		this.closing_date = closing_date;
	}

	public double getGen_avg_rate() {
		return gen_avg_rate;
	}

	public void setGen_avg_rate(double gen_avg_rate) {
		this.gen_avg_rate = gen_avg_rate;
	}
	
}
