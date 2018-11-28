package gallery;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import db.DBClose;
import db.DBOpen;

public class GalleryDAO {
	public boolean create(GalleryDTO dto) {
		boolean flag = false;

		return flag;
	}

	public GalleryDTO read(int gno) {
		GalleryDTO dto = new GalleryDTO();
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select fname, title, to_char(udate, 'yyyy-MM-dd') as udate, writer, content, viewcnt ");
		sql.append(" from gallery ");
		sql.append(" where gno = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, gno);
			rs = pstmt.executeQuery();
			if (rs.next()) {
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

	public boolean update(GalleryDTO dto) {
		boolean flag = false;

		return flag;
	}

	public boolean delete(int gno) {
		boolean flag = false;

		return flag;
	}

	public List<GalleryDTO> list(Map map) {
		List<GalleryDTO> list = new ArrayList<GalleryDTO>();

		return list;
	}
}
