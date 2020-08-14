package kr.co.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.BoardDTO;
import kr.co.domain.CategoryDTO;
import kr.co.domain.GoodsDTO;
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
	
	//상품 중복확인
	@Override
	public int goodsChk(GoodsDTO goodsDTO) {
		return session.selectOne(NS + ".goodsChk", goodsDTO);
	}
	
	
	//상품 등록
	@Override
	public void goodsInsert(GoodsDTO goodsDTO) {
		//상품 번호 ++
		int gno = session.selectOne(NS + ".getGno");
		goodsDTO.setGno(gno);
		
		session.insert(NS + ".goodsInsert", goodsDTO);
	}
	
	//상품 리스트
	@Override
	public List<GoodsDTO> goodsList(int cno) {
		return session.selectList(NS + ".goodsList", cno);
	}
	
	//사진 삭제
	@Override
	public void deleteAttachByFileName(String filename) {
		session.delete(NS + ".deleteAttachByFileName", filename);
		
	}
	
	//게시글 등록
	@Override
	public void insert(BoardDTO boardDTO) {
		int bno = session.selectOne(NS + ".getBno");
		boardDTO.setBno(bno);
		
		session.insert(NS + ".insert", boardDTO);
		
	}
	
	//사진 등록
	@Override
	public void addAttach(String fileName, int bno) {
		int uno = session.selectOne(NS + ".getUno");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("uno", uno);
		map.put("fileName", fileName);
		map.put("bno", bno);
		session.insert(NS + ".addAttach", map);
		
	}

	//전부 게시글
	@Override
	public List<BoardDTO> boardList() {
		// TODO Auto-generated method stub
		return session.selectList(NS+".boardList");
	}

	//게시글 상세페이지
	@Override
	public BoardDTO boardOne(int bno) {
		return session.selectOne(NS+".boardOne", bno);
	}
}
