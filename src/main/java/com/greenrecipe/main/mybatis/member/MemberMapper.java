package com.greenrecipe.main.mybatis.member;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.greenrecipe.main.member.dto.BuyerDTO;

@Mapper
public interface MemberMapper {
	public BuyerDTO buyerIdCheck(String buyer_id);
	public int register(BuyerDTO buyerdto);
//	public int idCheck(String buyer_id);
	public ArrayList<BuyerDTO> buyerAll();
	public void keepLogin(Map<String, Object> map);
	public BuyerDTO BuyerSession(String buyer_sessionId);
}