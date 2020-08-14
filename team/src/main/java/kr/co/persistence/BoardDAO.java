package kr.co.persistence;

import java.util.List;

import kr.co.domain.BoardDTO;
import kr.co.domain.CategoryDTO;
import kr.co.domain.GoodsDTO;
import kr.co.domain.MemberDTO;

public interface BoardDAO {
	
	
	//멤버 리스트
	List<MemberDTO> memberList();
	
	////카테고리 리스트
	List<CategoryDTO> categoryList();
	
	//카테고리 중복확인
	int categoryChk(CategoryDTO categoryDTO);
	
	//카테고리 등록
	void categoryInsert(CategoryDTO categoryDTO);
	
	//상품 중복확인
	int goodsChk(GoodsDTO goodsDTO);
	
	//상품 등록
	void goodsInsert(GoodsDTO goodsDTO);
	
	//상품 리스트
	List<GoodsDTO> goodsList(int cno);
	
	//사진 삭제
	void deleteAttachByFileName(String filename);
	
	//게시글 등록
	void insert(BoardDTO boardDTO);
	
	//사진 등록
	void addAttach(String fileName, int bno);

}
