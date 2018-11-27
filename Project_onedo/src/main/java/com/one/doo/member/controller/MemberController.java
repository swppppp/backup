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
		log.info("중복체크결과, 중복되는아이디 수: "+count);
		String result = "{\"cnt\":"+count+"}";
	
		return result;
	}	
	
	// 이메일인증요청
	@PostMapping("emailCertify")
	public @ResponseBody String emailCertify(@RequestBody String email) {
		log.info("이메일인증 컨트롤러");
		log.info("입력받은 이메일"+email);
		//비즈니스로직~~
		
		String code = "1234";  //비즈니스로직을 통해 생성된 난수 사용
		String result = "{\"code\":"+code+"}";
		
		return result;
	}
	
}






