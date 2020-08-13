package kr.co.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.persistence.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Inject
	private BoardDAO bDAO;
}
