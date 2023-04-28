package iSpan.animalplanet.member.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import iSpan.animalplanet.model.Member;
import iSpan.animalplanet.model.ProductType;

@Repository
public interface MemberRepository extends JpaRepository<Member, Integer> {
	

    @Query(value = "from Member where u_account = :account and u_password = :password and u_status = 0 ")  // 狀態:是否停權 0=正常 1=待認證 2=停權
    Member findMemberByAccountAndPassword(@Param("account") String account, @Param("password") String password);

////    not yet...
//    @Query(value = "from Member where u_account = :id")
//    Member findById(@Param("id") String id);
    
    
    @Query(value = "from Member where u_account = :account")
    Member findByAccount(@Param("account") String account);
    
    
   
    
    
 
	public Page<Member> findByaccountContaining(String account, Pageable pageable);

    
    
    
    
    
    
    
    
    
    
    
    
    
    

    //ToDo updateMemberInfoByAccountId
    //@Query(value = "update Member set ??= ?? where account_id = :accountId")
    //Member updateMemberInfoByAccountId(@Param("accountId") String accountId);
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    ///////////////Wendy//////////////////////
    @Query("from Member where account=:account")
    public Optional<Member> findbyAccount(@Param("account") String account);
}