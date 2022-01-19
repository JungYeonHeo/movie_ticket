package org.movie.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.movie.DTO.ActorDTO;
import org.movie.DTO.DirectorDTO;
import org.movie.DTO.MovieDTO;
import org.movie.DTO.TrailerDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MovieDAO {

	@Autowired
	private SqlSession session;
	private String movieMapper = "org.movie.mappers.movie";
	private static MovieDAO movie;
	
	public MovieDAO() {}
	
	public static MovieDAO getInstance() {
		
		if(movie == null){
            synchronized (MovieDAO.class) {
                if(movie == null)
                	movie = new MovieDAO();
            }
        }
		return movie;
	}
	
	public List<MovieDTO> movieShowingListTop10() {
		List<MovieDTO> movieShowingList = session.selectList(movieMapper + ".movieSelectNowShowingTop10");
		 return movieShowingList;
	}
	
	public List<MovieDTO> movieNotShowingListTop10() {
		List<MovieDTO> movieNotShowingList = session.selectList(movieMapper + ".movieSelectNoTShowingTop10");
		return movieNotShowingList;
	}
	
	public List<MovieDTO> movieShowingList() {
		List<MovieDTO> movieShowingList = session.selectList(movieMapper + ".movieSelectNowShowing");
		 return movieShowingList;
	}
	
	public List<MovieDTO> movieNotShowingList() {
		List<MovieDTO> movieNotShowingList = session.selectList(movieMapper + ".movieSelectNotShowing");
		return movieNotShowingList;
	}

	public List<MovieDTO> movieGenreSearchShowingList(int search) {
		List<MovieDTO> movieGenreSearchShowingList = session.selectList(movieMapper + ".movieGenreShowingSearch", search);
		return movieGenreSearchShowingList;
	}
	
	public List<MovieDTO> movieGenreSearchNotShowingList(int search) {
		List<MovieDTO> movieGenreSearchNotShowingList = session.selectList(movieMapper + ".movieGenreNotShowingSearch", search);
		return movieGenreSearchNotShowingList;
	}

	public List<MovieDTO> movieTitleSearchShowingList(String search) {
		List<MovieDTO> movieTitleSearchShowingList = null;
		movieTitleSearchShowingList = session.selectList(movieMapper + ".movieTitleShowingSearch", search);
		return movieTitleSearchShowingList;
	}
	
	public List<MovieDTO> movieTitleSearchNotShowingList(String search) {
		List<MovieDTO> movieTitleSearchNotShowingList = null;
		movieTitleSearchNotShowingList = session.selectList(movieMapper + ".movieTitleNotShowingSearch", search);
		return movieTitleSearchNotShowingList;
	}

	public MovieDTO movieSelectOne(String no) {
		MovieDTO movieInfor = session.selectOne(movieMapper + ".movieSelectOne", no);
		return movieInfor;
	}

	public List<DirectorDTO> movieDirectorList(String no) {
		List<DirectorDTO> movieDirectorList = session.selectList(movieMapper + ".movieSelectDirector", no);
		return movieDirectorList;
	}

	public List<ActorDTO> movieActorList(String no) {
		List<ActorDTO> movieActorList = session.selectList(movieMapper + ".movieSelectActor", no);
		return movieActorList;
	}

	public List<String> movieImageList(String no) {
		List<String> movieImageList = session.selectList(movieMapper + ".movieSelectImage", no);
		return movieImageList;
	}

	public List<TrailerDTO> movieTrailerList(String no) {
		List<TrailerDTO> movieTrailerList = session.selectList(movieMapper + ".movieSelectTrailer", no);
		return movieTrailerList;
	}	
	
}
