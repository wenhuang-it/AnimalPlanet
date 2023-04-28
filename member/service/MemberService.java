package iSpan.animalplanet.member.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;

import iSpan.animalplanet.member.dao.MemberRepository;
import iSpan.animalplanet.model.Member;

@Transactional
@Service
public class MemberService {

	@Autowired
	private MemberRepository memberRepository;

	public Member getMember(String memberId, String credential) {
		Member res = memberRepository.findMemberByAccountAndPassword(memberId, credential);
		return res;
	}

	public Member save(Member member) {
		return memberRepository.save(member);
	}

	public Member findByMemberAccount(String account) {
		return memberRepository.findByAccount(account);
	}

	// to be sured...
	public Member findById(Integer id) {
		Optional<Member> optional = memberRepository.findById(id);

		if (optional.isPresent()) {
			return optional.get();
		}
		System.out.println("沒找到ID為" + id + "的資料");
		return null;
	}

// ----------------------------------  後台  ----------------------------------

	public List<Member> getAllMembers() {
		List<Member> res = memberRepository.findAll();
		return res;
	}

	public Page<Member> getMemberByPage(Integer pageNumber) {
		Pageable pgb = PageRequest.of(pageNumber - 1, 10, Sort.Direction.DESC, "uId");
		Page<Member> page = memberRepository.findAll(pgb);
		return page;
	}

	public void deleteById(Integer id) {
		memberRepository.deleteById(id);
	}

	public Page<Member> findByaccountContaining(@RequestParam(name = "n") String account, Integer pageNumber) {
		Pageable pgb = PageRequest.of(pageNumber - 1, 10, Sort.Direction.DESC, "uId");
		Page<Member> page = memberRepository.findByaccountContaining(account, pgb);
		return page;
	}

	//////////// Wendy/////////////////
	public Member findByAccount(String account) {
		Optional<Member> op = memberRepository.findbyAccount(account);
		if (op.isPresent()) {
			return op.get();
		}
		return null;
	}

	public Optional<Member> findByAccounts(String account) {
		Optional<Member> op = memberRepository.findbyAccount(account);
		if (op.isPresent()) {
			return op;
		}
		return null;
	}

}
