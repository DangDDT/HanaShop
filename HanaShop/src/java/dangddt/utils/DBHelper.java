/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dangddt.utils;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 *
 * @author tamda
 */
public class DBHelper implements Serializable{
    public static Connection makeConnection() throws ClassNotFoundException, SQLException, NamingException{
//     Static DATABASE
//        //1. Load Driver
//        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
//        //2. Create connection String
//        String url = "jdbc:sqlserver://localhost:1433;databaseName=SE1422";
//        //3. Open Connection
//        Connection con = DriverManager.getConnection(url,"sa","123");
//        return con;
//     Dynamic DATABASE use DataSource
       Context ctx = new InitialContext();
       Context envCtx = (Context) ctx.lookup("java:comp/env");
       DataSource ds = (DataSource) envCtx.lookup("HanaShopDS");
       Connection con = ds.getConnection();
       return con;
    }
}
