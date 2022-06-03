package org.movie.DTO;

public class ShowingTimeDTO {

	private String cinema_showing_id;
	private int cinema_seat_id;
	private String showing_time;
	
	public ShowingTimeDTO() {
	}

	public ShowingTimeDTO(String cinema_showing_id, String showing_time) {
		super();
		this.cinema_showing_id = cinema_showing_id;
		this.showing_time = showing_time;
	}

	public String getCinema_showing_id() {
		return cinema_showing_id;
	}

	public void setCinema_showing_id(String cinema_showing_id) {
		this.cinema_showing_id = cinema_showing_id;
	}
	
	public int getCinema_seat_id() {
		return cinema_seat_id;
	}

	public void setCinema_seat_id(int cinema_seat_id) {
		this.cinema_seat_id = cinema_seat_id;
	}

	public String getShowing_time() {
		return showing_time;
	}

	public void setShowing_time(String showing_time) {
		this.showing_time = showing_time;
	}
	
}
