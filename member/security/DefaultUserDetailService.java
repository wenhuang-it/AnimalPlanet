package iSpan.animalplanet.member.security;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import iSpan.animalplanet.member.dao.MemberRepository;
import iSpan.animalplanet.model.Member;

//MyUsersDetailService完整程式碼：

@Service
public class DefaultUserDetailService implements UserDetailsService {

	@Autowired
	private MemberRepository memberRepository;


	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		System.out.println("username: " + username);
//		Member member = memberRepository.findById(username);
		Member member = memberRepository.findByAccount(username);
		if (member == null) {
            throw new UsernameNotFoundException("該帳號不存在");            
        }
	    
		System.out.println("member: " + member);
		
		return new DefaultUserDetails(member);
	}
	
	



	
	
	
	
	

}
