package iSpan.animalplanet.member.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.CredentialsExpiredException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;

public class DefaultLoginFailHandler extends SimpleUrlAuthenticationFailureHandler{
	private static final String[] HEADERS_TO_TRY = {
            "X-Forwarded-For",
            "Proxy-Client-IP",
            "WL-Proxy-Client-IP",
            "HTTP_X_FORWARDED_FOR",
            "HTTP_X_FORWARDED",
            "HTTP_X_CLUSTER_CLIENT_IP",
            "HTTP_CLIENT_IP",
            "HTTP_FORWARDED_FOR",
            "HTTP_FORWARDED",
            "HTTP_VIA",
            "REMOTE_ADDR"
    };


    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception) throws IOException, ServletException {
       // String username = request.getParameter("username");
        String redirectUrl = "/member/loginFailPage";
        String ip = getClientIpAddress(request);
        

        LoginFailedException ex = new LoginFailedException("登入失敗，帳號或密碼錯誤");
        if(exception instanceof BadCredentialsException) {
            //是否要紀錄錯誤密碼
        }
        if(exception instanceof DisabledException){
            ex = new LoginFailedException("帳號尚未啟用");
            redirectUrl = "/member/loginFailPage";
            
        }
        if(exception instanceof LockedException){
            ex = new LoginFailedException("連續登入失敗，帳號已被鎖定，請稍後再試");
            redirectUrl = "/member/loginFailPage";
        }
        if(exception instanceof CredentialsExpiredException) {
            ex = new LoginFailedException("密碼過期，請更改密碼後，再登入");
            redirectUrl = "/member/loginFailPage";
        }
    
        super.setDefaultFailureUrl(redirectUrl);
//        super.onAuthenticationFailure(request, response, ex);
        super.onAuthenticationFailure(request, response, ex);
    }

    private String getClientIpAddress(HttpServletRequest request) {
        for (String header : HEADERS_TO_TRY) {
            String ip = request.getHeader(header);
            if (ip != null && ip.length() != 0 && !"unknown".equalsIgnoreCase(ip)) {
                return ip;
            }
        }
        return request.getRemoteAddr();
    }
	
}
