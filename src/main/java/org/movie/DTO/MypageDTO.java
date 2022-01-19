package org.movie.DTO;

public class MypageDTO {
	
	private String ticket_id;
	private String movie_id;
	private String title_ko;
	private String poster_img;
	private int g_rate_id;
	private String cinema_name;
	private String showing_date;
	private String showing_time;
	private int youth_count;
	private int adult_count;
	private String seat;
	private int total_price;
	private String payment;
	private String state;
	private String ticket_date;
	
	public MypageDTO() {
	}

	public MypageDTO(String ticket_id, String movie_id, String title_ko, String poster_img, int g_rate_id,
			String cinema_name, String showing_date, String showing_time, int youth_count, int adult_count, String seat,
			int total_price, String payment, String state, String ticket_date) {
		super();
		this.ticket_id = ticket_id;
		this.movie_id = movie_id;
		this.title_ko = title_ko;
		this.poster_img = poster_img;
		this.g_rate_id = g_rate_id;
		this.cinema_name = cinema_name;
		this.showing_date = showing_date;
		this.showing_time = showing_time;
		this.youth_count = youth_count;
		this.adult_count = adult_count;
		this.seat = seat;
		this.total_price = total_price;
		this.payment = payment;
		this.state = state;
		this.ticket_date = ticket_date;
	}

	public String getTicket_id() {
		return ticket_id;
	}

	public void setTicket_id(String ticket_id) {
		this.ticket_id = ticket_id;
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

	public String getCinema_name() {
		return cinema_name;
	}

	public void setCinema_name(String cinema_name) {
		this.cinema_name = cinema_name;
	}

	public String getShowing_date() {
		return showing_date;
	}

	public void setShowing_date(String showing_date) {
		this.showing_date = showing_date;
	}

	public String getShowing_time() {
		return showing_time;
	}

	public void setShowing_time(String showing_time) {
		this.showing_time = showing_time;
	}

	public int getYouth_count() {
		return youth_count;
	}

	public void setYouth_count(int youth_count) {
		this.youth_count = youth_count;
	}

	public int getAdult_count() {
		return adult_count;
	}

	public void setAdult_count(int adult_count) {
		this.adult_count = adult_count;
	}

	public String getSeat() {
		return seat;
	}

	public void setSeat(String seat) {
		this.seat = seat;
	}

	public int getTotal_price() {
		return total_price;
	}

	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}

	public String getPayment() {
		return payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getTicket_date() {
		return ticket_date;
	}

	public void setTicket_date(String ticket_date) {
		this.ticket_date = ticket_date;
	}

	@Override
	public String toString() {
		return "MypageDTO [ticket_id=" + ticket_id + ", movie_id=" + movie_id + ", title_ko=" + title_ko
				+ ", poster_img=" + poster_img + ", g_rate_id=" + g_rate_id + ", cinema_name=" + cinema_name
				+ ", showing_date=" + showing_date + ", showing_time=" + showing_time + ", youth_count=" + youth_count
				+ ", adult_count=" + adult_count + ", seat=" + seat + ", total_price=" + total_price + ", payment="
				+ payment + ", state=" + state + ", ticket_date=" + ticket_date + "]";
	}

}
