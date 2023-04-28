package iSpan.animalplanet.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import iSpan.animalplanet.member.dao.MemberPetRepository;
import iSpan.animalplanet.model.MemberPet;

@Service
public class MemberPetService {
	
	
	
	 @Autowired
	    private MemberPetRepository memberPetRepository;

	    public MemberPet save(MemberPet memberPet) {
	        return memberPetRepository.save(memberPet);
	    }
	

	public MemberPetService() {
		// TODO Auto-generated constructor stub
	}

}
