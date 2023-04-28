package iSpan.animalplanet.member.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import iSpan.animalplanet.model.MemberPet;

public interface MemberPetRepository extends JpaRepository<MemberPet, Integer> {

}
