package org.movie.DTO;

public class ActorDTO {

	private String movie_id;
	private String actor_name_ko;
	private String actor_name_en;
	private String actor_img;
	
	public ActorDTO() {
	}

	public ActorDTO(String movie_id, String actor_name_ko, String actor_name_en, String actor_img) {
		super();
		this.movie_id = movie_id;
		this.actor_name_ko = actor_name_ko;
		this.actor_name_en = actor_name_en;
		this.actor_img = actor_img;
	}

	public String getMovie_id() {
		return movie_id;
	}

	public void setMovie_id(String movie_id) {
		this.movie_id = movie_id;
	}

	public String getActor_name_ko() {
		return actor_name_ko;
	}

	public void setActor_name_ko(String actor_name_ko) {
		this.actor_name_ko = actor_name_ko;
	}

	public String getActor_name_en() {
		return actor_name_en;
	}

	public void setActor_name_en(String actor_name_en) {
		this.actor_name_en = actor_name_en;
	}

	public String getActor_img() {
		return actor_img;
	}

	public void setActor_img(String actor_img) {
		this.actor_img = actor_img;
	}

	@Override
	public String toString() {
		return "ActorDTO [movie_id=" + movie_id + ", actor_name_ko=" + actor_name_ko + ", actor_name_en="
				+ actor_name_en + ", actor_img=" + actor_img + "]";
	}
	
}
