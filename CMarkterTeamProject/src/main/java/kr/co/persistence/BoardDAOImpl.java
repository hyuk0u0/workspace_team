package kr.co.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.domain.BoardDTO;

@Repository
public class BoardDAOImpl implements BoardDAO {
  @Autowired
  private SqlSession boaSession;

  private final String NS = "b.o.a";

  @Override
  public void insert(BoardDTO bDto) {
    boaSession.insert(NS + ".insert", bDto);
  }

  @Override
  public List<BoardDTO> clist() {
    return boaSession.selectList(NS + ".clist");
  }

  @Override
  public List<BoardDTO> glist() {
    return boaSession.selectList(NS + ".glist");
  }

  @Override
  public List<BoardDTO> list() {
    return boaSession.selectList(NS + ".list");
  }

  @Override
  public BoardDTO read(String bno) {
    return boaSession.selectOne(NS + ".read", bno);
  }

  @Override
  public BoardDTO updateUI(int bno) {
    return boaSession.selectOne(NS + ".updateUI", bno);
  }

  @Override
  public void update(BoardDTO bDto) {
    boaSession.update(NS + ".update", bDto);
  }
}
