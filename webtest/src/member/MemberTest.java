package member;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class MemberTest {

	public static void main(String[] args) {
		MemberDAO dao = new MemberDAO();
		total(dao);
		//delete(dao);
		//update(dao);
		//read(dao);
		//list(dao);
		//create(dao);

	}

	private static void total(MemberDAO dao) {
		Map map = new HashMap();
		String col = "job";
		String word = "val";
		
		map.put("col", col);
		map.put("word", word);
		
		System.out.println(dao.total(map));
		
		
	}

	private static void delete(MemberDAO dao) {
		if(dao.delete("오호식"))  {
			p("delete 성공");
		} else {
			p("delete 실패");
		}
		
		
	}

	private static void update(MemberDAO dao) {
		MemberDTO dto = new MemberDTO();
		dto.setId("오호식");
		dto.setPasswd("1234");
		dto.setTel("1234");
		dto.setEmail("hhh@mail.com");
		dto.setZipcode("1234");
		dto.setAddress1("1234");
		dto.setAddress2("1234");
		dto.setJob("software developer");
		if(dao.update(dto)) {
			p("update 성공");
		} else {
			p("update 실패");
		}
		
	}

	private static void read(MemberDAO dao) {
		MemberDTO dto = new MemberDTO();
		dto = dao.read("고지원");
		p(dto);
		
	}

	private static void list(MemberDAO dao) {
		List<MemberDTO> list = dao.list();
		Iterator iter = list.iterator();
		while(iter.hasNext()) {
			MemberDTO dto = (MemberDTO) iter.next();
			p(dto);
			p("______________________");
		}
		
		
	}

	private static void p(MemberDTO dto) {
		p("ID: "+dto.getId());
		p("Passwd: "+dto.getPasswd());
		p("Mname: "+dto.getMname());
		p("Tel: "+dto.getTel());
		p("Email: "+dto.getEmail());
		p("Zipcode: "+dto.getZipcode());
		p("Address: "+dto.getAddress1()+dto.getAddress2());
		p("Job: "+dto.getJob());
		p("Date: "+dto.getMdate());
		p("Fname: "+dto.getFname());
		p("Grade: "+dto.getGrade());
	}

	private static void create(MemberDAO dao) {
		MemberDTO dto = new MemberDTO();
		dto.setId("new user");
		dto.setPasswd("1234");
		dto.setMname("new mname");
		dto.setTel("1234");
		dto.setEmail("new@mail.com");
		dto.setZipcode("1234");
		dto.setAddress1("1234");
		dto.setAddress2("1234");
		dto.setJob("개발자4");
		dto.setFname("new fname");
		dto.setGrade("Z");
		
		if (dao.create(dto)) {
			p("create 성공");
		} else {
			p("create 실패");
		}
		
	}

	private static void p(String string) {
		System.out.println(string);
		
	}

}
