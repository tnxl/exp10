package JavaBean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DB {

    Connection connection;

    String classname = "com.mysql.jdbc.Driver";
    String jdbc = "jdbc:mysql://localhost:3306/lyb?serverTimezone=UTC";
    String root = "root";
    String pass = "1234";

    public Connection getConnection(){
        try {
            Class.forName(classname);
            connection = DriverManager.getConnection(jdbc,root,pass);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }

    public void close(){
        if (connection!=null){
            try {
                connection.close();
                connection = null;
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

}
