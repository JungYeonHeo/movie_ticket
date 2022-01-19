package org.movie.DTO;

public class CinemaImageDTO {
	
	private String cinema_id;
	private String cinema_images;
	private String cinema_images_comment;
	
	public CinemaImageDTO() {
	}

	public CinemaImageDTO(String cinema_id, String cinema_images, String cinema_images_comment) {
		super();
		this.cinema_id = cinema_id;
		this.cinema_images = cinema_images;
		this.cinema_images_comment = cinema_images_comment;
	}

	public String getCinema_id() {
		return cinema_id;
	}

	public void setCinema_id(String cinema_id) {
		this.cinema_id = cinema_id;
	}

	public String getCinema_images() {
		return cinema_images;
	}

	public void setCinema_images(String cinema_images) {
		this.cinema_images = cinema_images;
	}

	public String getCinema_images_comment() {
		return cinema_images_comment;
	}

	public void setCinema_images_comment(String cinema_images_comment) {
		this.cinema_images_comment = cinema_images_comment;
	}

}
