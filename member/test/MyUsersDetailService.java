package iSpan.animalplanet.member.test;
//package iSpan.animalplanet.member.security;
//
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.core.GrantedAuthority;
//import org.springframework.security.core.authority.AuthorityUtils;
//import org.springframework.security.core.userdetails.User;
//import org.springframework.security.core.userdetails.UserDetails;
//import org.springframework.security.core.userdetails.UserDetailsService;
//import org.springframework.security.core.userdetails.UsernameNotFoundException;
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
//import org.springframework.stereotype.Service;
//
//import iSpan.animalplanet.member.dao.MemberRepository;
//import iSpan.animalplanet.model.Member;
//
////MyUsersDetailService完整程式碼：
//
//@Service
//public class MyUsersDetailService implements UserDetailsService {
//
//	@Autowired
//	private MemberRepository memberRepository;
//
//	@Override
//	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
//		System.out.println("username: " + username);
//		Member member = memberRepository.findById(username);
//		System.out.println("member: " + member);
//
////	  權限(固定用法,role是還沒用到所以拿來暫時先隨便亂取）
//		List<GrantedAuthority> auths = AuthorityUtils.commaSeparatedStringToAuthorityList("" + member.getRole());
//
////      return 用戶名稱,密碼,用戶角色（權限），用戶角色不可以為Null!
//		System.out.println(
//				new User(member.getAccount(), new BCryptPasswordEncoder().encode(member.getPassword()), auths));
//		return new User(username, new BCryptPasswordEncoder().encode(member.getPassword()), auths);
//	}
//
//	
//	
//
//}
