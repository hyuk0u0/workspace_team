package kr.co.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.domain.GoodsDTO;
import kr.co.persistence.GoodsDAO;

@Service
public class GoodsServiceImpl implements GoodsService {
  @Autowired
  private GoodsDAO gDao;

  @Override
  public void insert(GoodsDTO gDto) {
    gDao.insert(gDto);
  }

  @Override
  public List<GoodsDTO> list() {
    return gDao.list();
  }

  @Override
  public GoodsDTO updateUI(int gno) {
    return gDao.updateUI(gno);
  }

  @Override
  public void update(GoodsDTO gDto) {
    gDao.update(gDto);
  }

  @Override
  public int gooChk(GoodsDTO gDto) {
    int result = gDao.gooChk(gDto);
    return result;
  }

  @Override
  public List<GoodsDTO> clist() {
    return gDao.clist();
  }

}
