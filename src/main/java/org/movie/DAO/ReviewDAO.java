package org.movie.DAO;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
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
		List<ReviewDTO> reviewList = session.selectList(reviewMapper + ".reviewSelect", movie_id);
		return reviewList;
	}

	public void likeCountUpdate(HashMap<String, Object> map) {
		session.update(reviewMapper + ".likeCountUpdate", map);
	}

	public void reviewInsert(HashMap<String, Object> map) {
		session.insert(reviewMapper + ".reviewInsert", map);
	}

	public List<ReviewDTO> memberReviewList(String id) {
		List<ReviewDTO> memberReviewList = session.selectList(reviewMapper + ".memberReviewSelect", id);
		return memberReviewList;
	}

}
