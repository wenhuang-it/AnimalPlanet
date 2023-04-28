package iSpan.animalplanet.member.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;

import iSpan.animalplanet.member.mail.JavaMail;
import iSpan.animalplanet.member.security.DefaultUserDetails;
import iSpan.animalplanet.member.service.MemberPetService;
import iSpan.animalplanet.member.service.MemberService;
import iSpan.animalplanet.model.Member;
import iSpan.animalplanet.model.MemberPet;

@SessionAttributes(value = { "member" })
@RestController
public class MemberApiController {

	@Autowired
	private MemberService memberService;

	@Autowired
	private MemberPetService memberPetService;

	@Autowired
	private PasswordEncoder passwordEncoder;

//	@Autowired
//	private MemberRepository memberRepository;

///////////////////////////////////////////////////////  楊導測試  ///////////////////////////////////////////////////////
	@PostMapping("/postmemapi")
	public Member testInsert(@RequestBody Member mem) {
		return memberService.save(mem);
	}

//---------------------------------------------  會員登入  ---------------------------------------------

//	@PostMapping(path = { "/loginApi" })
//	public Member testfunc(@RequestBody LoginDto loginDto) {
//		System.out.println(loginDto.toString());
//		Member res = memberService.getMember(loginDto.getId(), loginDto.getPassword());
//
//		// System.out.println(res.toString());
//		// Member res =
//		// memberRepository.findMemberByAccountAndPassword(member.getAccount(),
//		// member.getPassword());
//
//		// 傳到前端顯示"登入失敗"
//		if (null == res) {
//			res = new Member();
//			res.setuId(0);
//		}
//		return res;
//	}

//---------------------------------------------  新增會員  ---------------------------------------------
	@PostMapping(path = { "/registerApi" })
	public Member register(@RequestBody Member member) { // Member member 為前端傳進來的物件

//		設定創立時間
//		String timeStamp = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());	
		Date date = new Date();
		member.setCreateDate(date);

		// 1:驗證中
		member.setStatus(1);

		// 2:普通會員
		member.setRole(2);

		// 对密码进行加密
		member.setPassword(passwordEncoder.encode(member.getPassword()));

		Member res = memberService.save(member);

//		// 發信到client email		
		JavaMail mail = new JavaMail();
		mail.SendMail(res.getuId(), res.getAccount(), res.geteMail());

		return res; // 回傳給前端
	}

	// --------------------------------------------- 新增會員寵物 ---------------------------------------------

	@PostMapping(path = { "/addMemberPetApi/{memberId}" })
	public MemberPet addMemberPetApi(@PathVariable Integer memberId, @RequestBody MemberPet memberPet) {
		// 根據 member ID 從數據庫中查找對應的 member
		Member member = memberService.findById(memberId);

		memberPet.setMember(member);
		MemberPet res = memberPetService.save(memberPet);

		return res; // 回傳給前端
	}

	// --------------------------------------------- LINE新增會員 ---------------------------------------------
	@PostMapping(path = { "/lineRegisterApi" })
	public Member lineRegister(@RequestBody Member member) {

//			設定創立時間
//			String timeStamp = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());	
		Date date = new Date();
		member.setCreateDate(date);

		// 設定密碼
//		member.setPassword("line");
		member.setPassword(passwordEncoder.encode("line"));

		// 0: 直接可用
		member.setStatus(0);
		// 2:普通會員
		member.setRole(2);

		Member res = memberService.save(member);

		return res; // 回傳給前端
	}
//---------------------------------------------  驗證會員EMAIL --------------------------------------------

	@PostMapping(path = { "/member/emailAuthApi/{id}" })
	public String emailAuth(@PathVariable Integer id) {

		Member member = memberService.findById(id);

		// 0: 啟用
		member.setStatus(0);
		memberService.save(member);

		return "redirect:/login";
	}

//---------------------------------------------  取得會員資料  ---------------------------------------------
//	@GetMapping(path = { "/getMemberByIdApi/{id}" })
//	public Member getMemberById(@PathVariable Integer id) {		
//		Member res = memberService.findById(id);	
//		return res;
//	}

	@GetMapping(path = { "/getMemberByIdApi" })
	public Member getMemberByIdTest(@AuthenticationPrincipal DefaultUserDetails userDetails) {
		userDetails.getInfo().get("account");

		// 新增一個service 傳入參數account 回傳 member資訊
		Member res = memberService.findByMemberAccount(userDetails.getUsername());

		return res;
	}

//	// ---- 取得memberPet -----
//	
//	@GetMapping(path = { "/getMemberPetByIdApi" })
//	public List<MemberPet> getMemberPetByIdApi(@AuthenticationPrincipal DefaultUserDetails userDetails) {		
//		userDetails.getInfo().get("account");
//		
//		//新增一個service 傳入參數account 回傳 member資訊
//		Member res = memberService.findByMemberAccount(userDetails.getUsername());
//		
//		return null;
//	}

//---------------------------------------------  編輯會員資料  ---------------------------------------------

	@PostMapping(path = { "/updateMemberInfoByAccountIdApi" })
	public Member updateMemberInfoByAccountId(@RequestBody Member member) {
		member.setStatus(0); // 要給, 不然會給null
		member.setRole(2); // 要給, 不然會給null

		// TO-DO: 要做判斷if....
		// 对密码进行加密
//		member.setPassword(passwordEncoder.encode(member.getPassword()));

		Member res = memberService.save(member);
		System.out.println(res);

		return res;
	}

	// TO-DO: 要做判斷if....
	// TO-DO: 要做判斷if....
	// TO-DO: 要做判斷if....
	// TO-DO: 要做判斷if....
	@PostMapping(path = { "/updateMemberCredentialApi" })
	public Member updateMemberCredential(@RequestBody Member member) {
		member.setStatus(0); // 要給, 不然會給null
		member.setRole(2); // 要給, 不然會給null

		// TO-DO: 要做判斷if....
		// 对密码进行加密
		member.setPassword(passwordEncoder.encode(member.getPassword()));

		Member res = memberService.save(member);
		System.out.println(res);

		return res;
	}

//---------------------------------------------  刪除會員  ---------------------------------------------
	@PostMapping(path = { "/deleteByAccountIdApi" })
	public Member deleteMemberByAccountId(@RequestBody Member member) {
		member.setRole(2); // 要給, 不然會給null
		member.setStatus(2); // 0=正常 1=待認證 2=停權

		Member res = memberService.save(member);
		System.out.println(res);

		return res;
	}

////---------------------------------------------  後台: 取所有會員  ---------------------------------------------
//
////	@ResponseBody
////	@PostMapping(path = { "/getAllMembersApi" })
////	public List<Member> findAllCustomer(){
////		return memberService.getAllMembers();
////	}
//
//	@ResponseBody
//	@GetMapping("/getAllMembersApi2")
//	public Page<Member> listProductType(Model m, @RequestParam(name = "p", defaultValue = "1") Integer pageNumber) {
//		Page<Member> page = memberService.getMemberByPage(pageNumber);
////		m.addAttribute("page", page);
//		return page;
//	}
//
//	@DeleteMapping("/member/backStage/api/{uId}")
//	public String deleteProductApi(@PathVariable Integer uId) {
//		memberService.deleteById(uId);
//		return "redirect:/getAllMembersApi2";
//	}
//
//	@ResponseBody
//	@GetMapping("/member/namelike")
//	public Page<Member> findByNameLike(@RequestParam(name = "n") String account,
//			@RequestParam(name = "p", defaultValue = "1") Integer pageNumber) {
//		return memberService.findByaccountContaining(account, pageNumber);
//	}
//	
//
//	
//	// radio停權
//	@GetMapping("/inactivateMemberApi/")
//	public Member inactivateMemberApi(@RequestParam("uId") Integer uId, @RequestParam Integer status) {
//		Member member = memberService.findById(uId);
//		member.setStatus(status);
//		Member res = memberService.save(member);
//		
//		return res;
//	}

	
	
	
	//---------------------------------------------  後台: 取所有會員  ---------------------------------------------

//	@ResponseBody
//	@PostMapping(path = { "/getAllMembersApi" })
//	public List<Member> findAllCustomer(){
//		return memberService.getAllMembers();
//	}

	@ResponseBody
	@GetMapping("/getAllMembersApi2")
	public Page<Member> listProductType(Model m, @RequestParam(name = "p", defaultValue = "1") Integer pageNumber) {
		Page<Member> page = memberService.getMemberByPage(pageNumber);
//		m.addAttribute("page", page);
		return page;
	}

	@DeleteMapping("/member/backStage/api/{uId}")
	public void deleteProductApi(@PathVariable Integer uId) {
		memberService.deleteById(uId);
//		return "redirect:/getAllMembersApi2";
	}

	@ResponseBody
	@GetMapping("/member/namelike")
	public Page<Member> findByNameLike(@RequestParam(name = "n") String account,
			@RequestParam(name = "p", defaultValue = "1") Integer pageNumber) {
		return memberService.findByaccountContaining(account, pageNumber);
	}
	
	
	// radio停權
	@GetMapping("/inactivateMemberApi/")
	public Member inactivateMemberApi(@RequestParam("uId") Integer uId, @RequestParam Integer status) {
		Member member = memberService.findById(uId);
		member.setStatus(status);
		Member res = memberService.save(member);
		
		return res;
	}

}

