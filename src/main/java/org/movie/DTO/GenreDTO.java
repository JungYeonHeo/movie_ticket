package org.movie.DTO;

public class GenreDTO {

	private String genre_id;
	private String genre_en;
	private String genre_ko;
	
	public GenreDTO() {
	}

	public GenreDTO(String genre_id, String genre_en, String genre_ko) {
		super();
		this.genre_id = genre_id;
		this.genre_en = genre_en;
		this.genre_ko = genre_ko;
	}

	public String getGenre_id() {
		return genre_id;
	}

	public void setGenre_id(String genre_id) {
		this.genre_id = genre_id;
	}

	public String getGenre_en() {
		return genre_en;
	}

	public void setGenre_en(String genre_en) {
		this.genre_en = genre_en;
	}

	public String getGenre_ko() {
		return genre_ko;
	}

	public void setGenre_ko(String genre_ko) {
		this.genre_ko = genre_ko;
	}

	@Override
	public String toString() {
		return "GenreDTO [genre_id=" + genre_id + ", genre_en=" + genre_en + ", genre_ko=" + genre_ko + "]";
	}
	
}
