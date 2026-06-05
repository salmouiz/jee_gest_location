package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectDB {
	private String url= "jdbc:mysql://localhost:3306/DB_User";
	private String username = "root";
	private String password = "";
	private static Connection c= null;
	
	public ConnectDB() {
		try {
			c=DriverManager.getConnection(url, username, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public static Connection getConnection() {
		if(c==null) {
			new ConnectDB();
		}
		return c;
	}
}
