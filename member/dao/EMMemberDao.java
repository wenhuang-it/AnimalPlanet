//package iSpan.animalplanet.member.dao;
//
//import java.util.List;
//
//import javax.persistence.EntityManager;
//import javax.persistence.PersistenceContext;
//import javax.persistence.Query;
//import javax.transaction.Transactional;
//
//import org.springframework.data.domain.Page;
//import org.springframework.data.domain.PageImpl;
//import org.springframework.data.domain.Pageable;
//import org.springframework.stereotype.Repository;
//
//import iSpan.animalplanet.model.Member;
//
//@Repository
//@Transactional
//public class EMMemberDao {
//	
// @PersistenceContext
// private EntityManager em;
//
// public Page<Member> findselect(List<Integer> productTypelist, Pageable pageable) {
//
//  // 商品有上架的
//  String sql = "SELECT * FROM Product pdt"
//    + " INNER JOIN product_product_type as ppt on pdt.product_id = ppt.fk_product_id"
//    + "　INNER JOIN product_type as pt on pt.product_type_id = ppt.fk_productType_id"
//    + " WHERE pdt.product_launch_situation = 1";
//
//  if (!productTypelist.isEmpty()) {
//   sql += " AND pt.product_type_id IN (:productTypelist)";
//  }
//
//  Query query = em.createNativeQuery(sql, Member.class);
//  System.out.println(productTypelist);
//
//  if (!productTypelist.isEmpty()) {
//   query.setParameter("productTypelist", productTypelist);
//  }
//
//  int total = query.getResultList().size();
//
//  List<Member> productList = query.setFirstResult((int) pageable.getOffset())
//    .setMaxResults(pageable.getPageSize()).getResultList();
//
//  return new PageImpl<>(productList, pageable, total);
////  return query.getResultList();
// }
//
//}
