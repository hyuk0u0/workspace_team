package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.domain.CategoryDTO;
import kr.co.domain.MemberDTO;
import kr.co.persistence.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Inject
	private BoardDAO bDAO;
	
	//멤버 리스트
	@Override
	public List<MemberDTO> memberList() {
		return bDAO.memberList();
	}
	
	////카테고리 리스트
	@Override
	public List<CategoryDTO> categoryList() {
		return bDAO.categoryList();
	}
	
	//카테고리 중복확인
	@Override
	public int categoryChk(CategoryDTO categoryDTO) {
		return bDAO.categoryChk(categoryDTO);
	}
	
	//카테고리 등록
	@Override
	public void categoryInsert(CategoryDTO categoryDTO) {
		bDAO.categoryInsert(categoryDTO);
		
	}
}
