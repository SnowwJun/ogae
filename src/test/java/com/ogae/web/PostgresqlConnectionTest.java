//package com.ogae.web;
//
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.ResultSet;
//import java.sql.Statement;
//
//import org.junit.Test;
//
///**
// * Database(PostgreSQL) Connect Test
// * @author JIN
// *
// */
//public class PostgresqlConnectionTest {
//	
//	private String URL = "jdbc:postgresql://database-server.cgiuvbgh0ihg.ap-northeast-2.rds.amazonaws.com:5432/ogaedb";
//	private String USERNAME = "ogae";
//	private String PASSWORD = "ogaeadmin";
//	
//	@Test
//	public void ConnectionTest() throws Exception {
//		Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
//		System.out.println(conn);
//		Statement stmt = conn.createStatement();
//		ResultSet rs = stmt.executeQuery("select * from test");
//		if(rs.next()) {
//			System.out.println(rs);
//			System.out.println(rs.getInt("idx"));
//			System.out.println(rs.getString("content"));
//		}
//	}
//}
