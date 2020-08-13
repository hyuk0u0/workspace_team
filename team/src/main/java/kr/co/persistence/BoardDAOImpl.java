package kr.co.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.CategoryDTO;
import kr.co.domain.MemberDTO;

@Repository
public class BoardDAOImpl implements BoardDAO {
	
	@Inject
	private SqlSession session;
	
	private final String NS = "b.o.a";
	
	//멤버 리스트
	@Override
	public List<MemberDTO> memberList() {
		return session.selectList(NS + ".memberList");
	}
	
	//카테고리 리스트
	@Override
	public List<CategoryDTO> categoryList() {
		return session.selectList(NS + ".categoryList");
	}
	
	//카테고리 중복확인
	@Override
	public int categoryChk(CategoryDTO categoryDTO) {
		return session.selectOne(NS + ".categoryChk", categoryDTO);
	}
	
	//카테고리 등록
	@Override
	public void categoryInsert(CategoryDTO categoryDTO) {
		//카테고리 번호 ++
		int cno = session.selectOne(NS + ".getCno");
		categoryDTO.setCno(cno);
				
		
		session.insert(NS + ".categoryInsert", categoryDTO);
	}
}
