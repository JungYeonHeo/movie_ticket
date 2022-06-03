package org.movie.DTO;

public class SeatInforDTO {
	
	private int cinema_seat_id;
	private String cinema_id;
	private String theater;
	private int seat_num;
	private int seat_row;
	private int seat_column;
	
	public SeatInforDTO() {
	}
	
	public SeatInforDTO(int cinema_seat_id, String cinema_id, String theater, int seat_num, int seat_row,
			int seat_column) {
		super();
		this.cinema_seat_id = cinema_seat_id;
		this.cinema_id = cinema_id;
		this.theater = theater;
		this.seat_num = seat_num;
		this.seat_row = seat_row;
		this.seat_column = seat_column;
	}

	public int getCinema_seat_id() {
		return cinema_seat_id;
	}

	public void setCinema_seat_id(int cinema_seat_id) {
		this.cinema_seat_id = cinema_seat_id;
	}

	public String getCinema_id() {
		return cinema_id;
	}

	public void setCinema_id(String cinema_id) {
		this.cinema_id = cinema_id;
	}

	public String getTheater() {
		return theater;
	}

	public void setTheater(String theater) {
		this.theater = theater;
	}

	public int getSeat_num() {
		return seat_num;
	}

	public void setSeat_num(int seat_num) {
		this.seat_num = seat_num;
	}

	public int getSeat_row() {
		return seat_row;
	}

	public void setSeat_row(int seat_row) {
		this.seat_row = seat_row;
	}

	public int getSeat_column() {
		return seat_column;
	}

	public void setSeat_column(int seat_column) {
		this.seat_column = seat_column;
	}
	
}
