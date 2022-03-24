package com.greenrecipe.main.member.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.greenrecipe.main.member.dto.BuyerDTO;
import com.greenrecipe.main.mybatis.member.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired MemberMapper mapper;
	
	BCryptPasswordEncoder en = new BCryptPasswordEncoder();
	
	public int buyerIdCheck(HttpServletRequest req) {
		BuyerDTO buyerdto = mapper.buyerIdCheck(req.getParameter("buyer_id"));
		if(buyerdto != null) {
			if(en.matches(req.getParameter("buyer_password"), buyerdto.getBuyer_password()) || buyerdto.getBuyer_password().equals(req.getParameter("buyer_password"))) {
				return 0;
			}
		}
		return 1;
	}
	
	
	public void buyerAll(Model model) {
		model.addAttribute("buyerAllList", mapper.buyerAll());
	}
	
	public int register(BuyerDTO buyerdto) {
		System.out.println("암호화 전 : " + buyerdto.getBuyer_password());
		String SecurityBuyer_password = en.encode(buyerdto.getBuyer_password());
		System.out.println("암호화 후 : " + SecurityBuyer_password);
		buyerdto.setBuyer_password(SecurityBuyer_password);
		buyerdto.setBuyer_sessionId("null");
		try {
			return mapper.register(buyerdto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
//	public int idCheck(String buyer_id) {
//        int cnt = mapper.idCheck(buyer_id);
//        return cnt;
//	}
	
	public void keepLogin(String buyer_sessionId, java.sql.Date buyer_limiteDate, String buyer_id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("buyer_sessionId", buyer_sessionId);
		map.put("buyer_limitDate", buyer_limiteDate);
		map.put("buyer_id", buyer_id);
		mapper.keepLogin(map);
	}
	
	public BuyerDTO BuyerSession(String buyer_sessionId) {
		return mapper.BuyerSession(buyer_sessionId);
	}
	
}