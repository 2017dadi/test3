package edu.nuaa.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import edu.nuaa.conn.DBUtil;

public class UserDao {
	
	public String getUsername(int uid, String password) {
		PreparedStatement ps = null;
		ResultSet rs = null;
		String username = null;
		
		String sql = "select username from user where uid = ? and password = ?";
		try {
			ps = DBUtil.conn().prepareStatement(sql);
			ps.setInt(1, uid);
			ps.setString(2, password);
			rs = ps.executeQuery();
			if (rs.next()) {
				username = rs.getString(1);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try{
			rs.close();
			ps.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		DBUtil.closeConn();
		return username;
	}

}
