package kr.co.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.domain.LoginDTO;
import kr.co.domain.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO {
  @Autowired
  private SqlSession memSession;

  private final String NS = "m.e.m";

  @Override
  public void insert(MemberDTO mDto) {
    memSession.insert(NS + ".insert", mDto);
  }

  @Override
  public List<MemberDTO> list() {
    return memSession.selectList(NS + ".list");
  }

  @Override
  public MemberDTO read(String id) {
    return memSession.selectOne(NS + ".read", id);
  }

  @Override
  public MemberDTO updateUI(String id) {
    return memSession.selectOne(NS + ".updateUI", id);
  }

  @Override
  public void update(MemberDTO mDto) {
    memSession.update(NS + ".update", mDto);
  }

  @Override
  public int idChk(MemberDTO mDto) {
    Integer result = memSession.selectOne(NS + ".idChk", mDto);
    return result;
  }

  @Override
  public List<MemberDTO> grlist() {
    return memSession.selectList(NS + ".grlist");
  }

  @Override
  public void delete(String id) {
    memSession.delete(NS + ".delete", id);
  }

  @Override
  public MemberDTO loginpost(LoginDTO login) {
    return memSession.selectOne(NS + ".loginpost", login);
  }

//  @Override
//  public void forByUserDel(String id) {
//    memSession.delete(NS + ".forByUserDel", id);
//  }

}
