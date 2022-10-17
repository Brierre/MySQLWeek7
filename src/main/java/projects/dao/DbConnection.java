package projects.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import projects.exception.DbException;

public class DbConnection {

	private static final String HOST = "localhost";
	private static final String PASSWORD = "projects";
	private static final int PORT = 3306;
	private static final String SCHEMA = "projects";
	private static final String USER = "projects";

	public static Connection getConnection() {
		//jdbc:mysql://host:port/schema user string, pw string, do not use SSL
		String uri = String.format("jdbc:mysql://%s:%d/%s?user=%s&password=%s&useSSL=false", HOST, PORT, SCHEMA, USER, PASSWORD);
		System.out.println("Connecting with uri=" + uri);
		
		try {
			Connection conn = DriverManager.getConnection(uri);
			System.out.println("Connection is successful!");
			return conn;
			
		} catch (SQLException e) {
			System.out.println("Unable to connect.");
			throw new DbException(e);
		}
	}
}
