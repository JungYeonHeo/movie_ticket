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
import org.movie.DTO.MovieDTO;
import org.movie.DTO.MypageReviewDTO;
import org.movie.DTO.MypageTicketDTO;
import org.movie.DTO.ReviewDTO;
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
		
		MemberDTO member = memberdao.login(map);
		int result = 0;
		if (member == null) {
			result = 1;
		} else {
			result = 2;
			httpss.setAttribute("myinfo", id);
		}
		return result;
	}

	@RequestMapping(value="/signup_id_check", method=RequestMethod.POST)
	public @ResponseBody int signup_id_check(String id) {
		
		MemberDTO member = memberdao.signupIdCheck(id);
		int result = 0;
		if (member == null) {
			result = 2;
		} else {
			result = 1;
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
		
		memberdao.signup(map);
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
		
		// 예매 목록
		String id = (String) httpss.getAttribute("myinfo");
		List<MypageTicketDTO> mypageTicketList = ticketdao.mypageTicketList(id);
		for (MypageTicketDTO m : mypageTicketList) {
			m.setTotal_price(comma(m.getTotal_price()));
		}
		model.addAttribute("mypageTicketList", mypageTicketList);
		
		// 리뷰 목록
		List<MypageReviewDTO> mypageReviewList = reviewdao.mypageReviewList(id);
		model.addAttribute("mypageReviewList", mypageReviewList);
		
		
		return "mypage";
	}
	
	@RequestMapping(value="/logout")
	public String logout(HttpSession httpss) {
		httpss.removeAttribute("myinfo");
		return "redirect:/"; 
	}
	
	@RequestMapping(value="/review_already_write", method=RequestMethod.GET)
	public @ResponseBody int review_already_write(String cinema_showing_id, HttpSession httpss) {
		String member_id = (String) httpss.getAttribute("myinfo");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("member_id", member_id);
		map.put("cinema_showing_id", cinema_showing_id);
		
		ReviewDTO review = reviewdao.reviewAlreadyWrite(map);
		if (review == null) {
			return 1;
		} else {
			return 2;
		}
	}
	
	@RequestMapping(value="/review_write")
	public String review_write(
			@RequestParam(value="no1", required=false) String cinema_showing_id, 
			@RequestParam(value="no2", required=false) String review_id, Model model) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("target", "address");
		map.put("search", "");
		
		List<CinemaDTO> cinemaList = cinemadao.cinemaList(map);
		model.addAttribute("cinemaList", cinemaList);
		
		// 리뷰 처음 작성
		model.addAttribute("cinema_showing_id", cinema_showing_id);
		
		// 리뷰 수정일 경우, 이미 작성한 리뷰 가져오기
		ReviewDTO review = reviewdao.reviewSelect(review_id);
		model.addAttribute("review", review);
		
		String id = "";
		if (cinema_showing_id != null) {
			id = cinema_showing_id; // 리뷰 처음 작성
		} else {
			id = review.getCinema_showing_id(); // 리뷰 수정
		}
		
		MovieDTO movieInfor = reviewdao.reviewMovieInfor(id);
		model.addAttribute("movieInfor", movieInfor);
		
		return "review_write"; 
	}
	
	@RequestMapping(value="/review_write_action", method=RequestMethod.GET, produces = "application/text; charset=utf8")
	public @ResponseBody void review_write_action(String cinema_showing_id, String text, double score, HttpSession httpss) {
		String member_id = (String) httpss.getAttribute("myinfo");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("member_id", member_id);
		map.put("cinema_showing_id", cinema_showing_id);
		map.put("text", text);
		map.put("score", score);
		
		reviewdao.reviewInsert(map);
	}
	
	@RequestMapping(value="/review_update_action", method=RequestMethod.GET, produces = "application/text; charset=utf8")
	public @ResponseBody void review_update_action(String review_id, String text, double score) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("review_id", review_id);
		map.put("text", text);
		map.put("score", score);
		
		reviewdao.reviewUpdate(map);
	}
	
	@RequestMapping(value="/review_delete_action", method=RequestMethod.GET)
	public @ResponseBody void review_delete_action(String review_id) {
		reviewdao.reviewDelete(review_id);
	}
	
}