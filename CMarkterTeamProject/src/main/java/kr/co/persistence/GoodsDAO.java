package kr.co.persistence;

import java.util.List;

import kr.co.domain.GoodsDTO;

public interface GoodsDAO {

  void insert(GoodsDTO gDto);

  List<GoodsDTO> list();

  GoodsDTO updateUI(int gno);

  void update(GoodsDTO gDto);

  int gooChk(GoodsDTO gDto);

  List<GoodsDTO> clist();

}
