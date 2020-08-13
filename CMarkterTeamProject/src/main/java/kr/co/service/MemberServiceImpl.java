package kr.co.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.domain.LoginDTO;
import kr.co.domain.MemberDTO;
import kr.co.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {
  @Autowired
  private MemberDAO mDao;

  @Override
  public int idChk(MemberDTO mDto) {
    int result = mDao.idChk(mDto);
    return result;
  }

  @Override
  public void insert(MemberDTO mDto) {
    mDao.insert(mDto);
  }

  @Override
  public List<MemberDTO> list() {
    return mDao.list();

  }

  @Override
  public MemberDTO read(String id) {
    return mDao.read(id);
  }

  @Override
  public void update(MemberDTO mDto) {
    mDao.update(mDto);
  }

  @Override
  public void delete(String id) {
    mDao.delete(id);
  }

  @Override
  public MemberDTO loginpost(LoginDTO login) {
    return mDao.loginpost(login);
  }

  @Override
  public List<MemberDTO> grlist() {
    return mDao.grlist();
  }

  @Override
  public MemberDTO updateUI(String id) {
    return mDao.updateUI(id);
  }

//  @Override
//  public void forByUserDel(String id) {
//    mDao.forByUserDel(id);
//  }
}
