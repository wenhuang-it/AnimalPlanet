package iSpan.animalplanet.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import iSpan.animalplanet.model.Member;

@SessionAttributes(value = { "member" })
@Controller
public class MemberPageController {

// 跳轉登入
//	@GetMapping(path={"/member/loginPage"})

	@GetMapping(path = { "/login" })
	public String loginPage() {
		return "member/F/loginPage";
	}

// 跳轉"登入失敗"
	@GetMapping(path = { "/member/loginFailPage" })
	public String loginFailPage() {
		return "member/F/loginFailPage";
	}

// 跳轉"沒有權限"
	@GetMapping(path = { "/member/accessFailPage" })
	public String accessFailPage() {
		return "accessFailPage";
	}

// 跳轉"註冊"
	@GetMapping(path = { "/member/registerPage" })
	public String registerPage() {
		return "member/F/registerPage";
	}

// 跳轉"Line登入後接受資料"
	@GetMapping(path = { "/member/receiveLinePage" })
	public String receiveLinePage() {
		return "member/F/receiveLinePage";
	}

// 跳轉"驗證EMAIL"
	@GetMapping(path = { "/member/successAuthPage" })
	public String successAuthPage() {
		return "member/F/successAuthPage";
	}

// 跳轉會員資訊 ??
	@GetMapping(path = { "/member/memberInfoPage" })
	public String memberInfoPage(Model m, HttpSession session) {

		Member member = new Member();

		m.addAttribute("member", member); //

		Member sessionMember = (Member) session.getAttribute("member");

		return "member/F/memberInfoPage";
	}

//    @GetMapping(path = {"/member/memberInfoPage"})
//    public String memberInfoPage(){
//    	return "member/F/memberInfoPage";}

	// ----------------------------------- 後台
	// ------------------------------------------
	// 跳轉"後台: 管理會員"

	@GetMapping(path = { "/member/memberSysPage" })
	public String memberSystem() {
		return "member/B/memberSysPage";
	}

	// 跳轉"後台: 管理會員"

	@GetMapping(path = { "/member/memberSysPage2" })
	public String memberSystem2() {
		return "member/B/memberSysPage2";
	}

}