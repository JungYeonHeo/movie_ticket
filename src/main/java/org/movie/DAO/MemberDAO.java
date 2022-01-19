package org.movie.DAO;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

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

	public String idcheck(String inputid) {
		String id = session.selectOne(memberMapper + ".selectid", inputid);
		return id;
	}

	public MemberDTO login_action(HashMap<String, String> map) {
		MemberDTO member = session.selectOne(memberMapper + ".login_action", map);
		return member;
	}

	public void signup_action(HashMap<String, String> map) {
		session.selectOne(memberMapper + ".signup_action", map);
	}
	
	public void memberUpdate(HashMap<String, String> map) {
		session.selectOne(memberMapper + ".memberupdate", map);
	}
}
