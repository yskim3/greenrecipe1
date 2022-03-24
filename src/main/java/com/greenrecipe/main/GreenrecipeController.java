package com.greenrecipe.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class GreenrecipeController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "default/main";
	}
	
	// 임시 controller
	
	@GetMapping("default/main")
	public String main() {
		return "default/main";
	}
	
	@GetMapping("help/helpAll")
	public String helpAll() {
		return "help/helpAll";
	}
	
	@GetMapping("help/helpWriteForm")
	public String helpWriteForm() {
		return "help/helpWriteForm";
	}
	
	@GetMapping("help/helpContentView")
	public String helpContentView() {
		return "help/helpContentView";
	}
	
	@GetMapping("help/helpModifyForm")
	public String helpModifyForm() {
		return "help/helpModifyForm";
	}
	
	@GetMapping("help/helpReplyForm")
	public String helpReplyForm() {
		return "help/helpReplyForm";
	}
	
	@GetMapping("inquiry/inquiryWriteForm")
	public String inquiryWriteFrom() {
		return "inquiry/inquiryWriteForm";
	}
	
	@GetMapping("inquiry/inquiryReplyForm")
	public String inquiryReplyForm() {
		return "inquiry/inquiryReplyForm";
	}
	
}