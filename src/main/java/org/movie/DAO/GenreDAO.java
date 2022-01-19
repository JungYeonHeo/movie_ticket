package org.movie.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.movie.DTO.GenreDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GenreDAO {

	@Autowired
	private SqlSession session;
	private String genreMapper = "org.movie.mappers.genre";
	private static GenreDAO genre;
	
	public GenreDAO() {}
	
	public static GenreDAO getInstance() {
		
		if(genre == null){
            synchronized (GenreDAO.class) {
                if(genre == null)
                	genre = new GenreDAO();
            }
        }
		return genre;
	}
	
	public List<GenreDTO> genreList() {
		List<GenreDTO> genreList = session.selectList(genreMapper + ".genreSelectAll");
		return genreList;
	}

	public int genreSelect(String search) {
		int searchNo = session.selectOne(genreMapper + ".genreSelect", search);
		return searchNo;
	}

	public List<String> movieGenreList(String no) {
		List<String> movieGenreList = session.selectList(genreMapper + ".movieSelectGenre", no);
		return movieGenreList;
	}

}
