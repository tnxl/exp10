package JavaBean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

public class OP {

    Connection connection;
    PreparedStatement psm;
    ResultSet resultSet;
    DB db = new DB();
    String sql;
    ArrayList<LyBean> al = null;

    public int register(String name,String pass,int age,String email){
        resultSet = getResultSet(name);
        int num = 0;
        try {
            if (!resultSet.next()){
                sql = "insert into lybtable(username,password,age,email) value(" +
                        "'"+name+"'," +
                        "'"+pass+"'," +
                        "'"+age+"'," +
                        "'"+email+"')";
                num = psm.executeUpdate(sql);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return num;
    }

    public boolean login(String name,String pass){
        resultSet = getResultSet(name);
        try {
            if (resultSet.next()){
                String password = resultSet.getString("password");
                if (password.equals(pass)){
                    return true;
                }
                resultSet.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public ArrayList<LyBean> showly(){
        try {
            LyBean ly;
            al = new ArrayList<LyBean>();
            sql = "select * from liuyan";
            connection = db.getConnection();
            psm = connection.prepareStatement(sql);
            resultSet = psm.executeQuery(sql);
            while (resultSet.next()){
                ly = new LyBean();
                ly.setId(resultSet.getInt("id"));
                ly.setName(resultSet.getString("username"));
                ly.setInfo(resultSet.getString("content"));
                ly.setTitle(resultSet.getString("title"));
                ly.setDate(resultSet.getString("date"));
                al.add(ly);
            }
            resultSet.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return al;
    }

    public int liuyan(String name,String info,String title){
        int n = 0;
        try {
            sql = "insert into liuyan(username,content,title,date) value(" +
                    "'"+name+"'," +
                "'"+info+"'," +
                    "'"+title+"'," +
                    "'"+new Date() +"')";
            connection = db.getConnection();
            psm = connection.prepareStatement(sql);
            n = psm.executeUpdate(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return n;

    }

    private ResultSet getResultSet(String name){
        try {
            connection = db.getConnection();
            sql = "select * from lybtable l where l.username = '"+name+"'";
            psm = connection.prepareStatement(sql);
            resultSet = psm.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultSet;
    }

}
