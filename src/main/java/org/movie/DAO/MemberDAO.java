package org.movie.DAO;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.movie.DTO.MemberDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSession session;
	private String memberMapper = "org.movie.mappers.member";
	private static MemberDAO member;

	public MemberDAO() {
	}

	public static MemberDAO getInstance() {

		if (member == null) {
			synchronized (MemberDAO.class) {
				if (member == null)
					member = new MemberDAO();
			}
		}
		return member;
	}

	public MemberDTO login(HashMap<String, String> map) {
		MemberDTO member = session.selectOne(memberMapper + ".login", map);
		return member;
	}
	
	public MemberDTO idCheck(String id) {
		MemberDTO member = session.selectOne(memberMapper + ".idCheck", id);
		return member;
	}

	public void signup(HashMap<String, String> map) {
		session.insert(memberMapper + ".signup", map);
	}
	
	public void updateMember(HashMap<String, String> map) {
		session.selectOne(memberMapper + ".updateMember", map);
	}

}
