package org.movie.DAO;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.movie.DTO.CinemaDTO;
import org.movie.DTO.CinemaImageDTO;
import org.movie.DTO.MovieDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CinemaDAO {

	@Autowired
	private SqlSession session;
	private String cinemaMapper = "org.movie.mappers.cinema";
	private static CinemaDAO cinema;
	
	public CinemaDAO() {}
	
	public static CinemaDAO getInstance() {
		
		if(cinema == null){
            synchronized (CinemaDAO.class) {
                if(cinema == null)
                	cinema = new CinemaDAO();
            }
        }
		return cinema;
	}
	
	public List<CinemaDTO> cinemaList(HashMap<String, String> map) {
		List<CinemaDTO> cinemaList = session.selectList(cinemaMapper + ".cinemaSearch", map);
		return cinemaList;
	}
	
	public List<CinemaDTO> cinemaShowingList(String movie_id) {
		List<CinemaDTO> cinemaList = session.selectList(cinemaMapper + ".cinemaShowingSearch", movie_id);
		return cinemaList;
	}

	public CinemaDTO selectOne(String no) {
		CinemaDTO cinema = session.selectOne(cinemaMapper + ".cinemaSelectOne", no);
		return cinema;
	}
    
	public List<MovieDTO> cinemaShowingMovieList(String no) {
		List<MovieDTO> cinemaShowingMovieList = session.selectList(cinemaMapper + ".cinemaShowingMovieList", no);
		return cinemaShowingMovieList;
	}

	public List<MovieDTO> cinemaNotShowingMovieList(String no) {
		List<MovieDTO> cinemaNotShowingMovieList = session.selectList(cinemaMapper + ".cinemaNotShowingMovieList", no);
		return cinemaNotShowingMovieList;
	}

	public List<CinemaImageDTO> cinemaImagesList(String no) {
		List<CinemaImageDTO> cinemaImages = session.selectList(cinemaMapper + ".cinemaImagesList", no);
		return cinemaImages;
	}
	
	
}
