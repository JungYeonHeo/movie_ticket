package org.movie.DTO;

public class TicketDTO {

 	private int ticket_id;
    private String member_id;
    private int cinema_showing_id;
    private int youth_count;
    private int adult_count;
    private String seat;
    private int total_price;
    private String payment;
    private String state;
    
    public TicketDTO() {
	}

	public TicketDTO(int ticket_id, String member_id, int cinema_showing_id, int youth_count, int adult_count,
			String seat, int total_price, String payment, String state) {
		super();
		this.ticket_id = ticket_id;
		this.member_id = member_id;
		this.cinema_showing_id = cinema_showing_id;
		this.youth_count = youth_count;
		this.adult_count = adult_count;
		this.seat = seat;
		this.total_price = total_price;
		this.payment = payment;
		this.state = state;
	}

	public int getTicket_id() {
		return ticket_id;
	}

	public void setTicket_id(int ticket_id) {
		this.ticket_id = ticket_id;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public int getCinema_showing_id() {
		return cinema_showing_id;
	}

	public void setCinema_showing_id(int cinema_showing_id) {
		this.cinema_showing_id = cinema_showing_id;
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

	@Override
	public String toString() {
		return "TicketDTO [ticket_id=" + ticket_id + ", member_id=" + member_id + ", cinema_showing_id="
				+ cinema_showing_id + ", youth_count=" + youth_count + ", adult_count=" + adult_count + ", seat=" + seat
				+ ", total_price=" + total_price + ", payment=" + payment + ", state=" + state + "]";
	}
    
}
