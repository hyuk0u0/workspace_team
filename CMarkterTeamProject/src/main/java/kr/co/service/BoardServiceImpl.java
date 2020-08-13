package kr.co.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.domain.BoardDTO;
import kr.co.persistence.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService {
  @Autowired
  private BoardDAO bDao;

  @Override
  public void insert(BoardDTO bDto) {
    bDao.insert(bDto);
  }

  @Override
  public List<BoardDTO> clist() {
    return bDao.clist();
  }

  @Override
  public List<BoardDTO> glist() {
    return bDao.glist();
  }

  @Override
  public List<BoardDTO> list() {
    return bDao.list();
  }

  @Override
  public BoardDTO read(String bno) {
    return bDao.read(bno);
  }

  @Override
  public BoardDTO updateUI(int bno) {
    return bDao.updateUI(bno);
  }

  @Override
  public void update(BoardDTO bDto) {
    bDao.update(bDto);
  }

}
