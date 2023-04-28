package iSpan.animalplanet.member.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

@Component
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {

  @Override
  public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
                                      Authentication authentication) throws IOException, ServletException {
    // 获取当前登录的用户
	  DefaultUserDetails userDetails = (DefaultUserDetails) authentication.getPrincipal();
    
    // 检查用户的某个属性是否等于1，例如一个名为 "flag" 的字段 
    if (userDetails.getInfo().get("role").equals(1) || userDetails.getInfo().get("role").equals(0)) {
    	
      // 如果用户的 "flag" 字段等于1，则重定向到其他页面，例如 "/dashboard"
      response.sendRedirect(request.getContextPath() + "/backStage");
    } else {
      // 否则重定向到默认的欢迎页面，例如 "/"
      response.sendRedirect(request.getContextPath() + "/");
    }
  }
}
