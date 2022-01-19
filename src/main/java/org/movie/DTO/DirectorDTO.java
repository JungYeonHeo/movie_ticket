package org.movie.DTO;

public class DirectorDTO {

	private String movie_id;
	private String director_name_ko;
	private String director_name_en;
	private String director_img;
	private String role;
	
	public DirectorDTO() {
	}

	public DirectorDTO(String movie_id, String director_name_ko, String director_name_en, String director_img,
			String role) {
		super();
		this.movie_id = movie_id;
		this.director_name_ko = director_name_ko;
		this.director_name_en = director_name_en;
		this.director_img = director_img;
		this.role = role;
	}

	public String getMovie_id() {
		return movie_id;
	}

	public void setMovie_id(String movie_id) {
		this.movie_id = movie_id;
	}

	public String getDirector_name_ko() {
		return director_name_ko;
	}

	public void setDirector_name_ko(String director_name_ko) {
		this.director_name_ko = director_name_ko;
	}

	public String getDirector_name_en() {
		return director_name_en;
	}

	public void setDirector_name_en(String director_name_en) {
		this.director_name_en = director_name_en;
	}

	public String getDirector_img() {
		return director_img;
	}

	public void setDirector_img(String director_img) {
		this.director_img = director_img;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	@Override
	public String toString() {
		return "DirectorDTO [movie_id=" + movie_id + ", director_name_ko=" + director_name_ko + ", director_name_en="
				+ director_name_en + ", director_img=" + director_img + ", role=" + role + "]";
	}
	
}
