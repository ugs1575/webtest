package address;

import java.util.Iterator;
import java.util.List;

public class AddressTest {
	
	public static void main(String[] args) {
		AddressDAO dao = new AddressDAO();
		//create(dao);
		list(dao);
		//read(dao);
		//update(dao);
		//delete(dao);
	}

	private static void delete(AddressDAO dao) {
		if (dao.delete(2)) {
			p ("삭제 성공");
		} else {
			p ("삭제 실패");
		}
	}

	private static void update(AddressDAO dao) {
		AddressDTO dto = new AddressDTO();
		dto.setNo(3);
		dto.setPhone("010-9566-9577");
		dto.setZipcode("12345");
		dto.setAddress("전라남도 광양시 광양읍");
		dto.setAddress2("구산리");
		
		if(dao.update(dto)) {
			p("수정 성공");
		} else {
			p("수정 실패");
		}
		
	}

	private static void read(AddressDAO dao) {
		p(dao.read(3));
	}

	private static void list(AddressDAO dao) {
		List<AddressDTO> list = dao.list();
		Iterator iter = list.iterator();
		while(iter.hasNext()) {
			AddressDTO dto = (AddressDTO) iter.next();
			p(dto);
			p("---------------------------------");
		}
		
	}

	private static void create(AddressDAO dao) {
		AddressDTO dto = new AddressDTO();
		dto.setName("임우석");
		dto.setPhone("010-7562-6538");
		dto.setZipcode("65214");
		dto.setAddress("서울특별시 은평구 진관동");
		dto.setAddress2("56");
		if(dao.create(dto)) {
			p("생성 성공");
		} else {
			p("생성 실패");
		}
	}

	private static void p(String string) {
		System.out.println(string);
		
	}

	private static void p(AddressDTO dto) {
		p("번호: " + dto.getNo());
		p("이름: " + dto.getName());
		p("핸드폰번호: " + dto.getPhone());
		p("우편번호: " + dto.getZipcode());
		p("주소: " + dto.getAddress() + dto.getAddress2());
	}

}
