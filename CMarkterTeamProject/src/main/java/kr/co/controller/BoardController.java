package kr.co.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.domain.BoardDTO;
import kr.co.service.BoardService;

@Controller
@RequestMapping("board")
public class BoardController {
  @Autowired
  private BoardService boaService;

  @RequestMapping(value = "/main", method = RequestMethod.GET)
  public String mainHome() {
    return "board/main.page";
  }

  @RequestMapping(value = "/update", method = RequestMethod.POST)
  public String update(BoardDTO bDto) {
    boaService.update(bDto);

    return "redirect:/board/list.page";
  }

  @RequestMapping(value = "/update/{bno}", method = RequestMethod.GET)
  public String updateui(Model model, @PathVariable("bno") int bno) {
    BoardDTO bDto = boaService.updateUI(bno);
    model.addAttribute("bDto", bDto);

    List<BoardDTO> clist = boaService.clist();
    model.addAttribute("clist", clist);

    List<BoardDTO> glist = boaService.glist();
    model.addAttribute("glist", glist);

    return "board/update.page";
  }

  @RequestMapping(value = "/read/{bno}", method = RequestMethod.GET)
  public String read(Model model, @PathVariable("bno") String bno) {
    BoardDTO bDto = boaService.read(bno);

    model.addAttribute("bDto", bDto);

    return "board/read.page";
  }

  @RequestMapping(value = "/list", method = RequestMethod.GET)
  public String list(Model model) {
    List<BoardDTO> blist = boaService.list();

    model.addAttribute("list", blist);

    return "board/list.page";
  }

  @RequestMapping(value = "/insert", method = RequestMethod.POST)
  public String insert(BoardDTO bDto) {

    boaService.insert(bDto);

    return "redirect:/board/list.page";
  }

  @RequestMapping(value = "/insert", method = RequestMethod.GET)
  public String insert(Model model) {
    List<BoardDTO> clist = boaService.clist();
    model.addAttribute("clist", clist);

    List<BoardDTO> glist = boaService.glist();
    model.addAttribute("glist", glist);

    return "board/insert.page";
  }
}
