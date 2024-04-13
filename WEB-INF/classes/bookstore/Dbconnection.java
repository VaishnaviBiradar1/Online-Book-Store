package bookstore;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Dbconnection implements InitializationDatabase  {
	public static Connection conn=null;
	public static Connection getConnection() {
		
		try {
			Class.forName(driverName);
			conn=DriverManager.getConnection(dbUrl, dbUserName, dbUserPassword);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		catch (SQLException e) {
		      e.printStackTrace();
		    }
		return conn;
	
	}

}