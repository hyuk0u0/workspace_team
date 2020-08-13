package kr.co.service;

import java.util.List;

import kr.co.domain.CategoryDTO;
import kr.co.domain.MemberDTO;

public interface BoardService {
	
	//멤버 리스트
	List<MemberDTO> memberList();
	
	//카테고리 리스트
	List<CategoryDTO> categoryList();
	
	//카테고리 중복확인
	int categoryChk(CategoryDTO categoryDTO);
	
	//카테고리 등록
	void categoryInsert(CategoryDTO categoryDTO);

}
