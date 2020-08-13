package kr.co.persistence;

import java.util.List;

import kr.co.domain.LoginDTO;
import kr.co.domain.MemberDTO;

public interface MemberDAO {

  void insert(MemberDTO mDto);

  List<MemberDTO> list();

  int idChk(MemberDTO mDto);

  MemberDTO updateUI(String id);

  void update(MemberDTO mDto);

  List<MemberDTO> grlist();

  void delete(String id);

  MemberDTO loginpost(LoginDTO login);

  MemberDTO read(String id);

//  void forByUserDel(String id);

}
