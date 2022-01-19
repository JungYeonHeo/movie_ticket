package org.movie.DTO;

public class TrailerDTO {

	private String movie_id;
	private String movie_video;
	private String movie_video_infor;
	private String opening_date;
	
	public TrailerDTO() {
	}

	public TrailerDTO(String movie_id, String movie_video, String movie_video_infor, String opening_date) {
		super();
		this.movie_id = movie_id;
		this.movie_video = movie_video;
		this.movie_video_infor = movie_video_infor;
		this.opening_date = opening_date;
	}

	public String getMovie_id() {
		return movie_id;
	}

	public void setMovie_id(String movie_id) {
		this.movie_id = movie_id;
	}

	public String getMovie_video() {
		return movie_video;
	}

	public void setMovie_video(String movie_video) {
		this.movie_video = movie_video;
	}

	public String getMovie_video_infor() {
		return movie_video_infor;
	}

	public void setMovie_video_infor(String movie_video_infor) {
		this.movie_video_infor = movie_video_infor;
	}

	public String getOpening_date() {
		return opening_date;
	}

	public void setOpening_date(String opening_date) {
		this.opening_date = opening_date;
	}

	@Override
	public String toString() {
		return "TrailerDTO [movie_id=" + movie_id + ", movie_video=" + movie_video + ", movie_video_infor="
				+ movie_video_infor + ", opening_date=" + opening_date + "]";
	}
	
}
