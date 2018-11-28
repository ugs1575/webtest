package memo;

import java.util.Iterator;
import java.util.List;

public class memoTest {

	public static void main(String[] args) {
		memoDAO dao = new memoDAO();
		list(dao);
		//delete(dao);
		//update(dao);
		//read(dao);
		create(dao);
	}
	private static void create(memoDAO dao) {
		memoDTO dto = new memoDTO();
		dto.setTitle("제목");
		dto.setContent("내용");
		
		if(dao.create(dto)) {
				p("성공");
			
		}else {
			p("실패");
		}
		
	}
	private static void read(memoDAO dao) {
		memoDTO dto = dao.read(11);
		p(dto);
		
	}
	private static void delete(memoDAO dao) {
		if(dao.delete(3)){
			p("성공");
			
		}else {
			p("실패");
		}
	}
	private static void list(memoDAO dao) {
		List<memoDTO> list = dao.list();
		
		Iterator<memoDTO> iter = list.iterator();
		
		while(iter.hasNext()) {
			memoDTO dto = iter.next();
			p(dto);
			p("------------------------------");
		}
	}
	private static void update(memoDAO dao) {
		memoDTO dto = new memoDTO();
		dto.setMemono(4);
		dto.setTitle("저녁약속");
		dto.setContent("프로젝트 관련 회의");
	
		if(dao.update(dto)) {
			p("성공");
			
		}else {
			p("실패");
		}
		
	}
	
	private static void p(String string) {
		// TODO Auto-generated method stub
		System.out.println(string);
	}
	private static void p(memoDTO dto) {
		// TODO Auto-generated method stub
		p("번호:"+dto.getMemono());
		p("제목:"+dto.getTitle());
		p("내용:"+dto.getContent());
		p("날짜:"+dto.getWdate());
		p("조회수:"+dto.getViewcnt());
	}

}
