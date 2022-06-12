package org.movie.DAO;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.movie.DTO.MovieDTO;
import org.movie.DTO.MypageReviewDTO;
import org.movie.DTO.ReviewDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewDAO {

	@Autowired
	private SqlSession session;
	private String reviewMapper = "org.movie.mappers.review";
	private static ReviewDAO review;
	
	public ReviewDAO() {}
	
	public static ReviewDAO getInstance() {
		
		if(review == null){
            synchronized (ReviewDAO.class) {
                if(review == null)
                	review = new ReviewDAO();
            }
        }
		return review;
	}
	
	public List<ReviewDTO> reviewList(String movie_id) {
		List<ReviewDTO> reviewList = session.selectList(reviewMapper + ".reviewList", movie_id);
		return reviewList;
	}

	public void likeCountUpdate(HashMap<String, Object> map) {
		session.update(reviewMapper + ".likeCountUpdate", map);
	}

	public void reviewInsert(HashMap<String, Object> map) {
		session.insert(reviewMapper + ".reviewInsert", map);
	}

	public List<MypageReviewDTO> mypageReviewList(String id) {
		List<MypageReviewDTO> mypageReviewList = session.selectList(reviewMapper + ".mypageReviewList", id);
		return mypageReviewList;
	}

	public ReviewDTO reviewAlreadyWrite(HashMap<String, Object> map) {
		ReviewDTO review = session.selectOne(reviewMapper + ".reviewAlreadyWrite", map);
		return review;
	}
	
	public ReviewDTO reviewSelect(String review_id) {
		ReviewDTO review = session.selectOne(reviewMapper + ".reviewSelect", review_id);
		return review;
	}
	
	public void reviewUpdate(HashMap<String, Object> map) {
		session.update(reviewMapper + ".reviewUpdate", map);
	}
	
	public void reviewDelete(String review_id) {
		session.delete(reviewMapper + ".reviewDelete", review_id);
	}

	public MovieDTO reviewMovieInfor(String cinema_showing_id) {
		MovieDTO movieInfor = session.selectOne(reviewMapper + ".reviewMovieInfor", cinema_showing_id);
		return movieInfor;
	}

}
