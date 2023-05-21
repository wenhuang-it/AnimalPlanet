package iSpan.animalplanet.member.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

//若要自訂登入邏輯則要繼承 WebSecurityConfigurerAdapter

//小複習:當@Configuration加在class上，表示這是一個設定spring用的class（裡面寫的東西都是設定spring)
@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	// @Qualifier("myUsersDetailService")
	private UserDetailsService userDetailsService;
	
	@Autowired
	private CustomLoginSuccessHandler customLoginSuccessHandler;

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(userDetailsService).passwordEncoder(password());
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		
		http.formLogin() // 自定義登入頁面
	            .loginPage("/login")
//	        
//	            .loginProcessingUrl("/user/login")
	            .loginProcessingUrl("/login") // 設定登入頁面的url
//		    .defaultSuccessUrl("/") // 成功登入之後導向
		    .successHandler(customLoginSuccessHandler)
		
		    // 登入成功之後要造訪的頁面
//		    .successForwardUrl("/member/registerPage")  
		    // 登入失敗後要造訪的頁面
//                  .failureUrl("/member/loginFailPage")  // 這個才會跳頁
//		    .failureForwardUrl("/member/loginFailPage")
	            .failureHandler(loginFailHandler())
				
				
		    .and().authorizeRequests() // 表示要定義哪些被保護，哪些不需要保護（不需要認證）
		    // 先設定不用通過的
		    .antMatchers("/**").permitAll() 
				
//				.antMatchers("/").permitAll()
//				.antMatchers("/login").permitAll()
				
//				.antMatchers("/member/registerPage").permitAll()
//				.antMatchers("/member/loginFailPage").permitAll()				
//				.antMatchers("/member/accessFailPage").permitAll()		
							
				
				
//				// 權限判斷
//				.antMatchers("/backStage/**").hasAnyAuthority("0","1") // 只有role="0"或"1"可以進去/backstage/**
//				// 必須要有 manager 角色才可以訪問
//				.antMatchers("/managerpage").hasRole("manager")
//				// 其他指定任意角色都可以訪問
//				.antMatchers("/employeepage").hasAnyRole("manager", "employee")

			
//				// 其他的都要被認證
				.anyRequest().authenticated()
				// 關閉防護
				.and().csrf().disable(); 
		
				
		// 登出  (不建議寫法)
				http.logout()
					.deleteCookies("JSESSIONID")
					.logoutSuccessUrl("/login")
					.logoutRequestMatcher(new AntPathRequestMatcher("/logout", "GET")) // 可以使用任何的HTTP方法登出
				;
				// 異常處理
				http.exceptionHandling()
					.accessDeniedPage("/member/accessFailPage");  // 請自行撰寫
//					.accessDeniedHandler(myAccessDeniedHandler);
				
				// 勿忘我（remember-me）
				http.rememberMe()
					.userDetailsService(userDetailsService)
					.tokenValiditySeconds(60); // 通常都會大於 session timeout 的時間
				
	}
	
	

	@Bean
	public PasswordEncoder password() {
		return new BCryptPasswordEncoder();
		
	}

	@Bean
	public DefaultLoginFailHandler loginFailHandler() {
		return new DefaultLoginFailHandler();
	}

}
