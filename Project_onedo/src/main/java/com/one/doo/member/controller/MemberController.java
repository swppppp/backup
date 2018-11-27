package com.one.doo.member.controller;

import javax.inject.Inject;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.one.doo.member.domain.Member;
import com.one.doo.member.service.MemberService;
import com.one.doo.member.validate.MemberValidator;

import lombok.extern.log4j.Log4j;

/**
 * Spring Security에서 사용하는 세부컨트롤러
 * @author 박의수, 박시원
 */
@Controller
@RequestMapping("/member/*")
@Log4j
public class MemberController{
	
	@Inject
	private MemberService memberService;
//	// 가입 유효성
//	@Inject
//	private MemberValidator validator;
	
	@RequestMapping("/error/error_403")
	public void accessDenied(Authentication auth, Model model){
		log.info("Access Denied: " + auth);
		model.addAttribute("msg", "Access Denied");
		model.addAttribute("auth", auth);
	}
	
	@RequestMapping("/customLogin")
	public void loginInput(String error, String logout, Model model){
		log.info("error: " + error);
		log.info("logout: " + logout);
		log.info(model);
		
		if(error != null) {
			model.addAttribute("error", "아이디와 비밀번호를 확인하세요.");			
		}
		
		if(logout != null) {
			model.addAttribute("logout", "로그아웃!!");			
		}
	}
	
	
	
	@GetMapping("/customLogout")
	public void logoutGET(){
		log.info("사용자 로그아웃 화면");
	}
	
	@PostMapping("/customLogout")
	public void logoutPOST(){
		log.info("사용자 로그아웃 처리");
	}
	
	
	
	// 회원가입
	@GetMapping("/regist") //화면요청
	public String regist() {
		log.info("---------regist화면-----------");
		return "redirect:/";  //home화면으로 redirect
	}
	// 회원가입요청
//	@PostMapping("/regist") //회원가입요청
//	public String regist(Member member, BindingResult bindingResult, Model model) {
//		log.info("--------regist------------");
//		// 유효성 체크
//		this.validator.validate(member, bindingResult);
//		if(bindingResult.hasErrors()) {
//			log.info("서버단 유효성 걸림...");
//			model.addAttribute("errors", bindingResult);
//			return "regist";
//		}else {
//			log.info("서버단 유효성 통과...");
//			memberService.regist(member);
//			return "home";
//		}
//		
//	}

	@PostMapping("/regist") //회원가입요청
	public String regist(@ModelAttribute("member") Member member, BindingResult bindingResult, Model model) {
		log.info("--------regist------------");
		// 유효성 체크
		//this.validator.validate(member, bindingResult);
		
		MemberValidator validator = new MemberValidator();
		validator.validate(member, bindingResult);
		if(bindingResult.hasErrors()) {
			log.info("서버단 유효성 걸림...");
			model.addAttribute("errors", bindingResult);
			return "redirect:/regist";
		}else {
			log.info("서버단 유효성 통과...");
			log.info("들어온 값으로 구성된 member객체: "+member);
			memberService.regist(member);
			return "index";
		}
	}
	
	//아이디 중복체크
	@PostMapping("idDupCheck")
	public @ResponseBody String idcheck(@RequestBody Member member){
		int count = 0;
		log.info(member.toString());
		
		count = memberService.idcheck(member.getUserid());
//		count = 1;
		log.info("중복체크결과, 중복되는아이디 수: "+count);
		String result = "{\"cnt\":"+count+"}";
//		map.put("cnt", count);
	
		return result;
		// security 적용 전, session 에러발생..(Cannot create a session after the response has been committed)
		// 403에러 쿼리까지 실행됨, return시 원래 jsp로 가면서 interceptor에 걸리는듯..(security관련 interceptor추정...ㅠㅠㅠ)
	}	
	
//	@RequestMapping(value="idcheck", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
//	public @ResponseBody String idcheck(HttpServletResponse response, @RequestParam("userid") String userid, Model model) {
//		log.info("idcheck컨트롤러 진입-------");
//		log.info("id값: "+userid);
//		int count = 0;
//		count = memberService.idcheck(userid);
//		log.info("중복체크결과 count: "+count);
////		model.addAttribute("cnt", count);
//		String result = "{'cnt':"+count+"}";
//		return result;
//	}

//	@RequestMapping("idcheck")
//	@ResponseBody
//	public void idcheck(HttpServletResponse response, @RequestBody String userid) {
//		log.info("idcheck컨트롤러 진입-------");
//		log.info("id값: "+userid);
//		int count = 0;
//		count = memberService.idcheck(userid);
//		log.info("중복체크결과 count: "+count);
//		response.setCharacterEncoding("utf-8");
//		response.addIntHeader("cnt", count);
////		model.addAttribute("cnt", count);
////		String result = "{'cnt':"+count+"}";
////		return null;
//	}
//
}






