package iSpan.animalplanet.member.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.UserDetails;

import iSpan.animalplanet.model.Employee;
import iSpan.animalplanet.model.Member;
import iSpan.animalplanet.model.MemberPet;

public class DefaultUserDetails implements UserDetails {

	    private String account;
	    private Integer userId;
	    private String password;
	    private Integer status;
	    private List<GrantedAuthority> authorities = new ArrayList<>();
	    private Map<String, Object> info = new HashMap<>();
	    private int role;
	    private List<MemberPet> memberPet;  //???

//	    private BigDecimal serviceRate;

	

	public DefaultUserDetails(Member member) {
		this.userId = member.getuId();
//		this.password = new BCryptPasswordEncoder().encode(member.getPassword());
		this.password = member.getPassword();
		this.status = member.getStatus();
		this.role = member.getRole();
		this.authorities = AuthorityUtils.commaSeparatedStringToAuthorityList("" + member.getRole());
		this.account = member.getAccount();

		this.memberPet = member.getMemberPet(); //??
		

		// 將所需帳號資訊傳入@AuthenticationPrincipal (UserDetail)物件放進session 減少網頁操作時撈取次數
		info.put("account", member.getAccount());
		info.put("role", member.getRole());
	}

	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return authorities;
	}

	public Map<String, Object> getInfo() {
		return info;
	}

	@Override
	public String getPassword() {
		return password;
	}

	@Override
	public String getUsername() {
		return account;
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() { // 狀態:是否停權 0=正常 1=待認證 2=停權
		if (status != null) {
			if (status == 0) {
				return true;
			} else if (status == 1 || status == 2) {
				return false;
			}
		}
		return false;
	}

	
	
	public List<MemberPet> getMemberPet(){	
		return memberPet;
	}
	
	

//    @Override
//    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
//        //權限(固定用法,role是還沒用到所以拿來暫時先隨便亂取）
//        List<GrantedAuthority> auths = AuthorityUtils.commaSeparatedStringToAuthorityList("role");
//        //return 用戶名稱,密碼,用戶角色（權限），用戶角色不可以為Null!
//        return new User("testusername",new BCryptPasswordEncoder().encode("abc123"),auths);
//    }

}
