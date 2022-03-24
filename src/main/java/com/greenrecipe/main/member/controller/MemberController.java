package com.greenrecipe.main.member.controller;

import java.util.Calendar;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.greenrecipe.main.member.dto.BuyerDTO;
import com.greenrecipe.main.member.service.MemberService;
import com.greenrecipe.main.session_name.MemberSessionName;

@Controller
@RequestMapping("member")
public class MemberController implements MemberSessionName {
	
	@Autowired MemberService ms;
	
	@GetMapping("login")
	public String login() {
		return "member/login";
	}
	
	@GetMapping("signup")
	public String signup() {
		return "member/signup";
	}
	
	@GetMapping("buyerSignup")
	public String buyerSignup() {
		return "member/buyerSignup";
	}
	
	@GetMapping("sellerSignup")
	public String sellerSignup() {
		return "member/sellerSignup";
		
	}
	
	@PostMapping("buyer_check")
	public String buyerIdCheck(HttpServletRequest req, RedirectAttributes rs) {
		
		System.out.println("TEST1");
		Enumeration params = req.getParameterNames();
		while(params.hasMoreElements()) {
		  String name = (String) params.nextElement();
		  System.out.print(name + " : " + req.getParameter(name) + "     "); 
		}
		
		int result = ms.buyerIdCheck(req);
		if(result == 0) {
			rs.addAttribute("buyer_id", req.getParameter("buyer_id"));
			rs.addAttribute("autoLogin", req.getParameter("autoLogin"));
			return "redirect:successLogin";
		}
		return "redirect:login";
	}
	
	@RequestMapping("successLogin")
	public String successLogin(@RequestParam String buyer_id, @RequestParam(required = false) String autoLogin, HttpSession session, HttpServletResponse response) {
		session.setAttribute(LOGIN, buyer_id);
		if(autoLogin != null) {
			int buyer_limitTime = 60*60*24*90;	// 90일
			Cookie loginCookie = new Cookie("loginCookie", session.getId());
			loginCookie.setPath("/");
			loginCookie.setMaxAge(buyer_limitTime);
			response.addCookie(loginCookie);
			Calendar cal = Calendar.getInstance();
			cal.setTime(new Date());
			cal.add(Calendar.MONTH, 3);
			java.sql.Date limiteDate = new java.sql.Date(cal.getTimeInMillis());
			ms.keepLogin(session.getId(), limiteDate, buyer_id);
		}
		return "member/successLogin";
	}
	
	@GetMapping("logout")
	public String logout(HttpSession session, HttpServletResponse response, @CookieValue(value = "loginCookie", required = false) Cookie loginCookie) {
		if(loginCookie != null) {
			loginCookie.setMaxAge(0);
			response.addCookie(loginCookie);
			ms.keepLogin("nan", new java.sql.Date(System.currentTimeMillis()), (String)session.getAttribute(LOGIN));
		}
		session.invalidate();
		return "redirect:/default/main";
	}
	
	@GetMapping("mypage")
	public String mypage() {
		return "member/mypage";
	}
	
	@GetMapping("buyerUpdateForm")
	public String buyerUpdateForm() {
		return "member/buyerUpdateForm";
	}
	
	@GetMapping("sellerUpdateForm")
	public String sellerUpdateForm() {
		return "member/sellerUpdateForm";
	}
	
	@GetMapping("searchIdForm")
	public String searchIdForm() {
		return "member/searchIdForm";
	}
	
	@GetMapping("searchPwForm")
	public String searchPwForm() {
		return "member/searchPwForm";
	}
	
	@GetMapping("buyerAll")
	public String buyerAll(Model model) {
		System.out.println("buyerAll connect");
		ms.buyerAll(model);
		return "member/buyerAll";
	}
	
	@GetMapping("sellerAll")
	public String sellerAll() {
		return "member/sellerAll";
	}
	
	@PostMapping("register")
	public String register(BuyerDTO buyerdto) {
		int result = ms.register(buyerdto);
		System.out.print("test!!!");
		System.out.print(result);
		if(result == 1) {
			return "redirect:login";
		}
		return "redirect:buyerSignup";
	}
	
//    // 아이디 체크
//	@PostMapping("/idCheck")
//	public Map<String, Object> idCheck(@RequestBody String buyer_id) {
//		System.out.print("중복 확인 요청 아이디 :" + buyer_id);
//		Map<String, Object> data = new HashMap<>();
//		int result = ms.idCheck(buyer_id);
//		if (result == 0) {
//			System.out.print("아이디 사용 가능");
//			data.put("id", "OK");
//		} else {
//			System.out.print("아이디 사용 불가능");
//			data.put("id", "NO");
//		}
//        return data;
//    }
	
}