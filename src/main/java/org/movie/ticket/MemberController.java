package org.movie.ticket;

import java.time.LocalDate;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.movie.DAO.CinemaDAO;
import org.movie.DAO.MemberDAO;
import org.movie.DAO.ReviewDAO;
import org.movie.DAO.TicketDAO;
import org.movie.DTO.CinemaDTO;
import org.movie.DTO.MemberDTO;
import org.movie.DTO.MypageDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MemberController {
	
	@Autowired
	private CinemaDAO cinemadao = CinemaDAO.getInstance();
	@Autowired
	private MemberDAO memberdao = MemberDAO.getInstance();
	@Autowired
	private ReviewDAO reviewdao = ReviewDAO.getInstance();
	@Autowired
	private TicketDAO ticketdao = TicketDAO.getInstance();
	
	@RequestMapping(value="/login")
	public String login(Model model) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("target", "address");
		map.put("search", "");
		
		List<CinemaDTO> cinemaList = cinemadao.cinemaList(map);
		model.addAttribute("cinemaList", cinemaList);
		
		return "login";
	}
	
	@RequestMapping(value="/signup")
	public String join(Model model) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("target", "address");
		map.put("search", "");
		
		List<CinemaDTO> cinemaList = cinemadao.cinemaList(map);
		model.addAttribute("cinemaList", cinemaList);
		
		// 회원가입 - 생년월일 날짜 
		LocalDate now = LocalDate.now(); 
		int year = now.getYear(); 
		
		String min_birth = String.valueOf(year-80) + "-01-01";
		String max_birth = String.valueOf(year-8) + "-01-01";
		
		model.addAttribute("min_birth", min_birth);
		model.addAttribute("max_birth", max_birth);
		
		return "signup";
	}
	
	@RequestMapping(value="/login_action", method=RequestMethod.POST)
	public @ResponseBody int login_action(String id, String pw, HttpSession httpss) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pw", pw);
		
		MemberDTO member = memberdao.login_action(map);
		int result = 0;
		if (member == null) {
			result = 1;
		} else {
			result = 2;
			httpss.setAttribute("myinfo", id);
		}
		return result;
	}

	@RequestMapping(value="/signup_action", method=RequestMethod.POST)
	public @ResponseBody void signup_action(String id, String pw, String name, 
			String phonenumber, String birth, String gender) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("member_id", id);
		map.put("member_pw", pw);
		map.put("member_name", name);
		map.put("phone_number", phonenumber);
		map.put("gender", gender);
		map.put("birth", birth);
		
		memberdao.signup_action(map);
	}
	
	public static String comma(String s) {
		if (s.length() <= 3) {
			return s;
		} else 
			return comma(s.substring(0, s.length()-3)) + ',' + s.substring(s.length()-3, s.length());
	}

	@RequestMapping(value="/mypage")
	public String mypage(Model model, HttpSession httpss) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("target", "address");
		map.put("search", "");
		
		List<CinemaDTO> cinemaList = cinemadao.cinemaList(map);
		model.addAttribute("cinemaList", cinemaList);
		
		String id = (String) httpss.getAttribute("myinfo");
		List<MypageDTO> mypageTicketList = ticketdao.mypageTicketList(id);
		for (MypageDTO m : mypageTicketList) {
			m.setTotal_price(comma(m.getTotal_price()));
		}
		model.addAttribute("mypageTicketList", mypageTicketList);
		
//		List<ReviewDTO> memberReviewList = reviewdao.memberReviewList(id);
//		model.addAttribute("memberReviewList", memberReviewList);
		
		return "mypage";
	}
	
	@RequestMapping(value="/logout")
	public String logout(HttpSession httpss) {
		httpss.removeAttribute("myinfo");
		return "redirect:/"; 
	}
	
	@RequestMapping(value="/review_write")
	public String review_write(@RequestParam String no, Model model) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("target", "address");
		map.put("search", "");
		
		List<CinemaDTO> cinemaList = cinemadao.cinemaList(map);
		model.addAttribute("cinemaList", cinemaList);
		
		model.addAttribute("movie_id", no);
		return "review_write"; 
	}
	
	@RequestMapping(value="/review_write_action", method=RequestMethod.GET, produces = "application/text; charset=utf8")
	public @ResponseBody void review_write_action(String movie_id, String text, double score, HttpSession httpss) {
		String member_id = (String) httpss.getAttribute("myinfo");
		String review_id = member_id + movie_id;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("review_id", review_id);
		map.put("member_id", member_id);
		map.put("movie_id", movie_id);
		map.put("text", text);
		map.put("score", score);
		
		reviewdao.reviewInsert(map);
	}
	
}