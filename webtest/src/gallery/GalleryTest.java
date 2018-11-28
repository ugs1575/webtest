package gallery;

public class GalleryTest {

	public static void main(String[] args) {
		GalleryDAO dao = new GalleryDAO();
		
		create(dao);
		//read(dao);
		//update(dao);
		//delete(dao);
		//list(dao);
		//total(dao);

	}

	private static void total(GalleryDAO dao) {
		// TODO Auto-generated method stub
		
	}

	private static void list(GalleryDAO dao) {
		// TODO Auto-generated method stub
		
	}

	private static void delete(GalleryDAO dao) {
		// TODO Auto-generated method stub
		
	}

	private static void update(GalleryDAO dao) {
		// TODO Auto-generated method stub
		
	}

	private static void read(GalleryDAO dao) {
		// TODO Auto-generated method stub
		GalleryDTO dto = null;
		p("?");
		p(dto);
	}

	private static void p(GalleryDTO dto) {
		// TODO Auto-generated method stub
		
	}

	private static void p(String string) {
		// TODO Auto-generated method stub
		System.out.println(string);
	}

	private static void create(GalleryDAO dao) {
		GalleryDTO dto = new GalleryDTO();
		dto.setTitle("일출");
		dto.setWriter("김씨");
		dto.setContent("일출사진입니다.");
		dto.setPw("1234");
		dto.setFname("1234.jpg");
		
		if(dao.create(dto))
			p("성공");
		else
			p("실패");
		
		
	}

}
