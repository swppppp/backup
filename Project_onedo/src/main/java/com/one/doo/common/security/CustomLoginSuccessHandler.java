package com.one.doo.common.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import lombok.extern.log4j.Log4j;

/**
 * 로그인 성공 이후에 특정 동작 제어를 위한 핸들러
 * @author 김기정
 *
 */
@Log4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler{

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		log.info("로그인 성공!!");
		List<String> roleNames = new ArrayList<String>();
		Collection<? extends GrantedAuthority> collection = authentication.getAuthorities();
		collection.forEach(authority ->{
			roleNames.add(authority.getAuthority());
		});
		
		for (GrantedAuthority grantedAuthority : collection) {
				roleNames.add(grantedAuthority.getAuthority());
				log.info("등록된 권한 이름들 : " + roleNames);
		}
		

		
		if(roleNames.contains("ROLE_ADMIN")) {
			response.sendRedirect(request.getContextPath() + "/member/admin");
			return;
		}
		
		if(roleNames.contains("ROLE_USER")) {
			response.sendRedirect(request.getContextPath() + "/member/member");
			return;
		}
		
		response.sendRedirect(request.getContextPath());
	}
	
	

}
