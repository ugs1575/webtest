package gallery;

import java.awt.Image;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.swing.ImageIcon;

import db.DBClose;
import db.DBOpen;

public class GalleryDAO {
	public boolean updateFile(Map map) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;

		String fname = (String) map.get("fname");
		int gno = (Integer) map.get("gno");

		StringBuffer sql = new StringBuffer();

		sql.append(" update gallery ");
		sql.append(" set fname = ? ");
		sql.append(" where gno = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());

			pstmt.setString(1, fname);
			pstmt.setInt(2, gno);

			int cnt = pstmt.executeUpdate();

			if (cnt > 0) {
				flag = true;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return flag;
	}
	
	public boolean delete(int gno) {
		boolean flag = false;
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" delete  from gallery ");
		sql.append(" where gno = ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
				pstmt.setInt(1, gno);
				
			int cnt = pstmt.executeUpdate();
			
			if(cnt > 0 ) flag = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}DBClose.close(pstmt, con);
		
		
		
		
		
		return flag;
	}
	
	public GalleryDTO read(int gno) {
		GalleryDTO dto = new GalleryDTO();
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select gno, pw, fname, title, to_char(udate, 'yyyy-MM-dd') as udate, writer, content, viewcnt ");
		sql.append(" from gallery ");
		sql.append(" where gno = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, gno);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto.setGno(rs.getInt("gno"));
				dto.setPw(rs.getString("pw"));
				dto.setFname(rs.getString("fname"));
				dto.setTitle(rs.getString("title"));
				dto.setUdate(rs.getString("udate"));
				dto.setWriter(rs.getString("writer"));
				dto.setContent(rs.getString("content"));
				dto.setViewcnt(rs.getInt("viewcnt"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}

		return dto;
	}

	public void upViewCnt(int gno) {
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" update gallery ");
		sql.append(" set viewcnt = viewcnt + 1 ");
		sql.append(" where gno = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, gno);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(pstmt, con);
		}
	}

	public List readList(int gno) {
		List list = new ArrayList();
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT * FROM  ");
		sql.append("   (  ");
		sql.append("      select    ");
		sql.append("          lag(gno,2)     over (order by gno ) pre_gno2,   ");
		sql.append("          lag(gno,1)     over (order by gno ) pre_gno1,  ");
		sql.append("          gno, ");
		sql.append("          lead(gno,1)    over (order by gno ) nex_gno1,   ");
		sql.append("          lead(gno,2)    over (order by gno ) nex_gno2,   ");
		sql.append("          lag(fname,2)  over (order by gno ) pre_fname2,    ");
		sql.append("          lag(fname,1)  over (order by gno ) pre_fname1, ");
		sql.append("          fname,  ");
		sql.append("          lead(fname,1) over (order by gno ) nex_fname1, ");
		sql.append("          lead(fname,2) over (order by gno ) nex_fname2  ");
		sql.append("          from (  ");
		sql.append("               SELECT gno, fname   ");
		sql.append("               FROM gallery ");
		sql.append("               ORDER BY gno desc ");
		sql.append("          )  ");
		sql.append("   ) where gno = ?");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, gno);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int[] lGno = { rs.getInt("pre_gno2"), rs.getInt("pre_gno1"), rs.getInt("gno"), rs.getInt("nex_gno1"),
						rs.getInt("nex_gno2") };
				String[] lFname = { rs.getString("pre_fname2"), rs.getString("pre_fname1"), rs.getString("fname"),
						rs.getString("nex_fname1"), rs.getString("nex_fname2"), };
				list.add(lGno);
				list.add(lFname);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBClose.close(rs, pstmt, con);
		}

		return list;
	}

	/*public boolean passwdCheck(Map map) {
		boolean flag = false;

		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int gno = (Integer) map.get("gno");
		String oldpw = (String) map.get("oldpw");

		StringBuffer sql = new StringBuffer();

		sql.append(" SELECT COUNT(*) ");
		sql.append(" FROM gallery ");
		sql.append(" where gno = ? and pw = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());

			pstmt.setInt(1, gno);
			pstmt.setString(2, oldpw);

			rs = pstmt.executeQuery();
			rs.next();

			int check = rs.getInt(1);

			if (check == 1) {
				flag = true;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}

		return flag;
	}*/
	public boolean passwdCheck(Map map) {
		boolean flag = false;
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuffer sql = new StringBuffer();
		
		int gno = (Integer) map.get("gno");
		String pw = (String) map.get("pw");
		
		sql.append(" select count(gno) as cnt ");
		sql.append(" from gallery ");
		sql.append(" where gno=? and pw=? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, gno);
			pstmt.setString(2, pw);
			
			rs = pstmt.executeQuery();
			rs.next();
			
			if (rs.getInt("cnt") == 1)
				
				flag = true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return flag;
	}


	public boolean updatePasswd(Map map) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;

		int gno = (Integer) map.get("gno");
		String pw = (String) map.get("pw");
		String newpw = (String) map.get("newpw");
		

		StringBuffer sql = new StringBuffer();

		sql.append(" update gallery ");
		sql.append(" set pw = ? ");
		sql.append(" where gno = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());

			pstmt.setString(1, newpw);
			pstmt.setInt(2, gno);

			int cnt = pstmt.executeUpdate();

			if (cnt > 0) {
				flag = true;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return flag;
	}


	public boolean updateInfo(Map map) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;

		int gno = (Integer)map.get("gno");
		String title = (String)map.get("title");
		String writer = (String)map.get("writer");
		String content = (String)map.get("content");
		String fname = (String)map.get("fname");
		
		StringBuffer sql = new StringBuffer();

		sql.append(" update gallery ");
		sql.append(" set fname = ?, title = ?, writer = ?, content = ? ");
		sql.append(" where gno = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());

			pstmt.setString(1, fname);
			pstmt.setString(2, title);
			pstmt.setString(3, writer);
			pstmt.setString(4, content);
			pstmt.setInt(5, gno);
			
			int cnt = pstmt.executeUpdate();

			if (cnt > 0) {
				flag = true;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return flag;
	}


public boolean update(GalleryDTO dto) {
		boolean flag = false;
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		
		sql.append(" UPDATE gallery ");
		sql.append(" SET title=?, content=? ");
		sql.append(" WHERE gno = ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setInt(3, dto.getGno());

			int cnt = pstmt.executeUpdate();
			
			if(cnt>0) {
				flag = true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(pstmt, con);
		}
		
		return flag;
	}
	
	public boolean create(GalleryDTO dto) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" insert into gallery ");
		sql.append(" (gno, title, udate, writer, content, fname, pw) ");
		sql.append(" values( ");
		sql.append(" (select nvl(max(gno), 0)+1 from gallery), ");
		sql.append(" ?, sysdate, ?, ?, ?, ?) ");
		
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getWriter());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getFname());
			pstmt.setString(5, dto.getPw());
			
			int cnt = pstmt.executeUpdate();
			if(cnt>0) flag = true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(pstmt, con);
		}
	
		
		
		
		return flag;
	}
	
		
	public List<GalleryDTO> list(Map map) {

		List<GalleryDTO> list = new ArrayList<GalleryDTO>();
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String col = (String)map.get("col");
		String word = (String)map.get("word");
		int sno = (Integer)map.get("sno");
		int eno = (Integer)map.get("eno");
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select gno,title,udate,writer,viewcnt,fname,r ");
		sql.append(" from(select gno,title,udate,writer,viewcnt,fname,rownum as r ");
		sql.append(" from(select gno,title,udate,writer,viewcnt,fname ");
		sql.append(" from gallery ");
		if(word.trim().length()>0)
			sql.append(" where " +col+" like '%'||?||'%' ");
		sql.append(" ORDER BY udate DESC ");
		sql.append(" ))where r >= ? and r <= ? ");
	
		int i=0;
		try {
			pstmt = con.prepareStatement(sql.toString());
			if (word.trim().length()>0)
				pstmt.setString(++i, word);
			
			pstmt.setInt(++i, sno);
			pstmt.setInt(++i, eno);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				GalleryDTO dto = new GalleryDTO();
				dto.setGno(rs.getInt("gno"));
				dto.setTitle(rs.getString("title"));
				dto.setUdate(rs.getString("udate"));
				dto.setWriter(rs.getString("writer"));
				dto.setContent(rs.getString("viewcnt"));
				dto.setFname(rs.getString("fname"));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}
		
		return list;
	}
	
	public int total(Map map) {
		int total =0;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String col = (String)map.get("col");
		String word = (String)map.get("word");
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(*) from gallery ");
		if(word.trim().length()>0)
			sql.append(" where "+col+" like  '%'||?||'%'");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			if(word.trim().length()>0)
				pstmt.setString(1, word);
			
			rs = pstmt.executeQuery();
			
			rs.next();
			
			total = rs.getInt(1);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}
		
		
		return total;
	}
}
	
