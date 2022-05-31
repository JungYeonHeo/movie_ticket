package org.movie.DAO;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.movie.DTO.ShowingTimeDTO;
import org.movie.DTO.CinemaDTO;
import org.movie.DTO.MemberDTO;
import org.movie.DTO.MovieDTO;
import org.movie.DTO.MypageDTO;
import org.movie.DTO.ReviewDTO;
import org.movie.DTO.TicketDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TicketDAO {

	@Autowired
	private SqlSession session;
	private String ticketMapper = "org.movie.mappers.ticket";
	private static TicketDAO ticket;
	
	public TicketDAO() {}
	
	public static TicketDAO getInstance() {
		
		if(ticket == null){
            synchronized (TicketDAO.class) {
                if(ticket == null)
                	ticket = new TicketDAO();
            }
        }
		return ticket;
	}
	
	public List<MemberDTO> ticketMemberSelect(String movie_id) {
		List<MemberDTO> ticketMemberList = session.selectList(ticketMapper + ".ticketMemberSelect", movie_id);
		return ticketMemberList;
	}

	public List<MypageDTO> mypageTicketList(String id) {
		List<MypageDTO> mypageTicketList = session.selectList(ticketMapper + ".mypageTicketList", id);
		return mypageTicketList;
	}
	
	public List<MovieDTO> ticketMovieList() {
		List<MovieDTO> ticketMovieList = session.selectList(ticketMapper + ".ticketMovieList");
		return ticketMovieList;
	}

	public List<CinemaDTO> ticketCinemaList() {
		List<CinemaDTO> ticketCinemaList = session.selectList(ticketMapper + ".ticketCinemaList");
		return ticketCinemaList;
	}

	public List<ShowingTimeDTO> ticketShowingTimeList(HashMap<String, Object> map) {
		List<ShowingTimeDTO> ticketShowingTimeList = session.selectList(ticketMapper + ".ticketShowingTimeList", map);
		return ticketShowingTimeList;
	}
	
	public void ticketInsert(HashMap<String, Object> map) {
		session.insert(ticketMapper + ".ticketInsert", map);
	}

}
