package org.movie.DAO;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.movie.DTO.AnswerDTO;
import org.movie.DTO.QuestionDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class QuestionDAO {
	
	@Autowired
	private SqlSession session;
	private String questionMapper = "org.movie.mappers.question";
	private static QuestionDAO question;

	public QuestionDAO() {
	}

	public static QuestionDAO getInstance() {

		if (question == null) {
			synchronized (QuestionDAO.class) {
				if (question == null)
					question = new QuestionDAO();
			}
		}
		return question;
	}

	public List<QuestionDTO> mypageQAList(String id) {
		List<QuestionDTO> mypageQAList = session.selectList(questionMapper + ".mypageQAList", id);
		return mypageQAList;
	}

	public void questionWrite(HashMap<String, String> map) {
		session.insert(questionMapper + ".questionWrite", map);
	}

	public AnswerDTO getAnswer(String question_id) {
		AnswerDTO answer = session.selectOne(questionMapper + ".getAnswer", question_id);
		return answer;
	}

	public QuestionDTO getQuestion(String question_id) {
		QuestionDTO question = session.selectOne(questionMapper + ".getQuestion", question_id);
		return question;
	}

}
