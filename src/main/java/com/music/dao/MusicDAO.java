package com.music.dao;


import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import com.music.vo.MusicVO;
import com.music.util.JDBCUtil;

public class MusicDAO {

	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;

	private final String M_INSERT = "insert into Music (title, artist, album, genre, chart, photo) values (?,?,?,?,?,?)";
	private final String M_UPDATE = "update Music set title=?, artist=?, album=?, genre=?, chart=?, photo=? where sid=?";
	private final String M_DELETE = "delete from Music  where sid=?";
	private final String M_SELECT = "select * from Music  where sid=?";
	private final String M_LIST = "select * from Music order by sid asc";

	public int insertMusic(MusicVO vo) {

		System.out.println("===> JDBC로 insertMusic() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(M_INSERT);
			stmt.setString(1, vo.getTitle());
			stmt.setString(2, vo.getArtist());
			stmt.setString(3, vo.getAlbum());
			stmt.setString(4, vo.getGenre());
			stmt.setString(5, vo.getChart());
			stmt.setString(6, vo.getPhoto());
			stmt.executeUpdate();
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	// 글 삭제
	public void deleteMusic(MusicVO vo) {
		System.out.println("===> JDBC로 deleteMusic() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(M_DELETE);
			stmt.setInt(1, vo.getSid());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public int updateMusic(MusicVO vo) {
		System.out.println("===> JDBC로 updateMusic() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(M_UPDATE);
			stmt.setString(1, vo.getTitle());
			stmt.setString(2, vo.getArtist());
			stmt.setString(3, vo.getAlbum());
			stmt.setString(4, vo.getGenre());
			stmt.setString(5, vo.getChart());
			stmt.setString(6, vo.getPhoto());
			stmt.setInt(7, vo.getSid());

			System.out.println(vo.getTitle() + "-" + vo.getArtist() + "-" + vo.getAlbum() + "-" + vo.getGenre() + "-" + vo.getChart() + "-" + vo.getSid());
			stmt.executeUpdate();
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public MusicVO getMusic(int sid) {
		MusicVO one = new MusicVO();
		System.out.println("===> JDBC로 getMusic() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(M_SELECT);
			stmt.setInt(1, sid);
			rs = stmt.executeQuery();
			if(rs.next()) {
				one.setSid(rs.getInt("sid"));
				one.setTitle(rs.getString("title"));
				one.setArtist(rs.getString("artist"));
				one.setAlbum(rs.getString("album"));
				one.setGenre(rs.getString("genre"));
				one.setChart(rs.getString("chart"));
				one.setPhoto(rs.getString("photo"));
				one.setRegdate(rs.getDate("regdate"));
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return one;
	}

	public List<MusicVO> getMusicList(){
		List<MusicVO> list = new ArrayList<MusicVO>();
		System.out.println("===> JDBC로 getMusicList() 기능 처리");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(M_LIST);
			rs = stmt.executeQuery();
			while(rs.next()) {
				MusicVO one = new MusicVO();
				one.setSid(rs.getInt("sid"));
				one.setTitle(rs.getString("title"));
				one.setArtist(rs.getString("artist"));
				one.setAlbum(rs.getString("album"));
				one.setGenre(rs.getString("genre"));
				one.setChart(rs.getString("chart"));
				one.setPhoto(rs.getString("photo"));
				one.setRegdate(rs.getDate("regdate"));
				list.add(one);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public String getPhotoFilename(int sid){
		String filename = null;
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(M_SELECT);
			stmt.setInt(1, sid);
			rs = stmt.executeQuery();
			if (rs.next()) {
				filename = rs.getString("photo");
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("===>JDBC로 getPhotoFilename() 기능 처리");
		return filename;
	}
}