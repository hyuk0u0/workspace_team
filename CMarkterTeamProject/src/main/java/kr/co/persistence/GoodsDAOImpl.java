package kr.co.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.domain.GoodsDTO;

@Repository
public class GoodsDAOImpl implements GoodsDAO {
  @Autowired
  private SqlSession gooSession;

  private final String NS = "g.o.o";

  @Override
  public void insert(GoodsDTO gDto) {
    gooSession.insert(NS + ".insert", gDto);
  }

  @Override
  public List<GoodsDTO> list() {
    return gooSession.selectList(NS + ".list");
  }

  @Override
  public GoodsDTO updateUI(int gno) {
    return gooSession.selectOne(NS + ".updateUI", gno);
  }

  @Override
  public void update(GoodsDTO gDto) {
    gooSession.update(NS + ".update", gDto);
  }

  @Override
  public int gooChk(GoodsDTO gDto) {
    Integer result = gooSession.selectOne(NS + ".gooChk", gDto);
    return result;
  }

  @Override
  public List<GoodsDTO> clist() {
    return gooSession.selectList(NS + ".clist");
  }

}
