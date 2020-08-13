package kr.co.service;

import java.util.List;

import kr.co.domain.LoginDTO;
import kr.co.domain.MemberDTO;

public interface MemberService {

  int idChk(MemberDTO mDto);

  void insert(MemberDTO mDto);

  List<MemberDTO> list();


  void update(MemberDTO mDto);

  void delete(String id);

  MemberDTO loginpost(LoginDTO login);

  List<MemberDTO> grlist();

  MemberDTO updateUI(String id);

  MemberDTO read(String id);

  

//  void forByUserDel(String id);

}
