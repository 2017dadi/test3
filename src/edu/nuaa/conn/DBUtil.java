package edu.nuaa.conn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {

	// 定义了MySQL数据库的驱动程序
	public static final String DBDRIVER = "org.gjt.mm.mysql.Driver";
	// 定义了MySQL数据库的连接地址
	public static final String DBURL = "jdbc:mysql://localhost:3306/nuaa";
	// 用户名
	public static final String DBUSER = "root";
	// 密码
	public static final String DBPASS = "admin";

	static Connection conn = null;

	public static Connection conn() {
		try {
			Class.forName(DBDRIVER);
			conn = DriverManager.getConnection(DBURL, DBUSER, DBPASS);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;

	}

	public static void closeConn() {
		try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
