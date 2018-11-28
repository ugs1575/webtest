package bbs;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.Iterator;

import memo.memoDTO;

public class BbsTest {

	public static void main(String[] args) {
		BbsDAO dao = new BbsDAO();
		//create(dao);
		//list(dao);
		read(dao);
		//update(dao);
		//delete(dao);
		//upViewcnt(dao);
		//psswdCheck(dao);

	}

	private static void psswdCheck(BbsDAO dao) {
		Map map = new HashMap();
		map.put("bbsno", 3);
		map.put("passwd", "비번");
		if(dao.passCheck(map)) {
			p("올바른 비번입니다");
		} else {
			p("잘못된 비번입니다");
		}
		
	}

	private static void upViewcnt(BbsDAO dao) {
		dao.upViewcnt(2);
		
	}

	private static void delete(BbsDAO dao) {
		if(dao.delete(1)){
			p("삭제 성공");
		} else {
			p("삭제 실패");
		}
			
	}

	private static void update(BbsDAO dao) {
		BbsDTO dto = new BbsDTO();
		dto.setBbsno(2);
		dto.setWname("최우식");
		dto.setTitle("제목할게없다...");
		dto.setContent("내용아아아아ㅏ아");
		
		if(dao.update(dto)){
			p("수정 성공");
		} else {
			p("수정 실패");
		}
		
	}

	private static void read(BbsDAO dao) {
		BbsDTO dto = dao.read(3);
		p(dto);
		
	}

	private static void list(BbsDAO dao) {
		List<BbsDTO> list = dao.list();
		Iterator<BbsDTO> iter = list.iterator();
		
		while(iter.hasNext()) {
			BbsDTO dto = iter.next();
			p(dto);
			p("------------------------------------");
		}
		
		
	}

	private static void p(BbsDTO dto) { 
		p("NUM: "+dto.getBbsno());
		p("NAME: "+dto.getWname());
		p("TITLE: "+dto.getTitle ());
		p("CONTENT: "+dto.getContent ());
		p("VIEWCNT: "+dto.getViewcnt());
		p("DATE: "+dto.getWdate());
		p("GRPNO: "+dto.getGrpno());
		p("INDENT: "+dto.getIndent());
		p("ANSNUM: "+dto.getAnsnum());
	}

	private static void create(BbsDAO dao) {
		BbsDTO dto = new BbsDTO();
		dto.setWname("우경서");
		dto.setTitle("제목뭐로하지?");
		dto.setContent("내용입니당");
		dto.setPasswd("비번");
		
		if(dao.create(dto)) {
			p("생성 성공");
		} else {
			p("생성 실패");
		}
		
	}

	private static void p(String string) {
		System.out.println(string);
	}

}
