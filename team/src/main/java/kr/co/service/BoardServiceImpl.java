package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.domain.BoardDTO;
import kr.co.domain.CategoryDTO;
import kr.co.domain.GoodsDTO;
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
	
	//상품 중복확인
	@Override
	public int goodsChk(GoodsDTO goodsDTO) {
		
		return bDAO.goodsChk(goodsDTO);
	}
	
	//상품 등록
	@Override
	public void goodsInsert(GoodsDTO goodsDTO) {
		bDAO.goodsInsert(goodsDTO);
	}
	
	//상품 리스트
	@Override
	public List<GoodsDTO> goodsList(int cno) {
		return bDAO.goodsList(cno);
	}
	
	//사진 삭제
	@Override
	public void deleteAttachByFileName(String filename) {
		bDAO.deleteAttachByFileName(filename);
	}
	
	//게시글 등록
	@Override
	public void insert(BoardDTO boardDTO) {
		bDAO.insert(boardDTO);
		String[] files = boardDTO.getFiles();
		
		if(files != null) {
			for(String fileName : files) {
				bDAO.addAttach(fileName, boardDTO.getBno());
			}
		}
		
	}
}
