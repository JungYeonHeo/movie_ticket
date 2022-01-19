package org.movie.DTO;

public class CinemaDTO {

	private String cinema_id;
	private String cinema_name;
	private String address;
	private String tel;
	private String parking_guidance;
	private String cinema_main_img;
	private String cinema_intro_title;
	private String cinema_intro;
	private String cinema_intro_img;
	
	public CinemaDTO() {
	}

	public CinemaDTO(String cinema_id, String cinema_name, String address, String tel, String parking_guidance,
			String cinema_main_img, String cinema_intro_title, String cinema_intro, String cinema_intro_img) {
		super();
		this.cinema_id = cinema_id;
		this.cinema_name = cinema_name;
		this.address = address;
		this.tel = tel;
		this.parking_guidance = parking_guidance;
		this.cinema_main_img = cinema_main_img;
		this.cinema_intro_title = cinema_intro_title;
		this.cinema_intro = cinema_intro;
		this.cinema_intro_img = cinema_intro_img;
	}

	public String getCinema_id() {
		return cinema_id;
	}

	public void setCinema_id(String cinema_id) {
		this.cinema_id = cinema_id;
	}

	public String getCinema_name() {
		return cinema_name;
	}

	public void setCinema_name(String cinema_name) {
		this.cinema_name = cinema_name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getParking_guidance() {
		return parking_guidance;
	}

	public void setParking_guidance(String parking_guidance) {
		this.parking_guidance = parking_guidance;
	}

	public String getCinema_main_img() {
		return cinema_main_img;
	}

	public void setCinema_main_img(String cinema_main_img) {
		this.cinema_main_img = cinema_main_img;
	}

	public String getCinema_intro_title() {
		return cinema_intro_title;
	}

	public void setCinema_intro_title(String cinema_intro_title) {
		this.cinema_intro_title = cinema_intro_title;
	}

	public String getCinema_intro() {
		return cinema_intro;
	}

	public void setCinema_intro(String cinema_intro) {
		this.cinema_intro = cinema_intro;
	}

	public String getCinema_intro_img() {
		return cinema_intro_img;
	}

	public void setCinema_intro_img(String cinema_intro_img) {
		this.cinema_intro_img = cinema_intro_img;
	}

	@Override
	public String toString() {
		return "CinemaVo [cinema_id=" + cinema_id + ", cinema_name=" + cinema_name + ", address=" + address + ", tel="
				+ tel + ", parking_guidance=" + parking_guidance + ", cinema_main_img=" + cinema_main_img
				+ ", cinema_intro_title=" + cinema_intro_title + ", cinema_intro=" + cinema_intro
				+ ", cinema_intro_img=" + cinema_intro_img + "]";
	}
	
}
