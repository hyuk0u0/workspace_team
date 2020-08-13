package kr.co.persistence;

import java.util.List;

import kr.co.domain.BoardDTO;

public interface BoardDAO {

  void insert(BoardDTO bDto);

  List<BoardDTO> clist();

  List<BoardDTO> glist();

  List<BoardDTO> list();

  BoardDTO read(String bno);

  BoardDTO updateUI(int bno);

  void update(BoardDTO bDto);

}
