package com.greenrecipe.main.member.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.greenrecipe.main.member.dto.BuyerDTO;

public interface MemberService {
	public int buyerIdCheck(HttpServletRequest req);
	public int register(BuyerDTO buyerdto);
//	public int idCheck(String buyer_id);
	public void buyerAll(Model model);
	public void keepLogin(String buyer_sessionId, java.sql.Date buyer_limiteDate, String buyer_id);
	public BuyerDTO BuyerSession(String buyer_sessionId);
}
