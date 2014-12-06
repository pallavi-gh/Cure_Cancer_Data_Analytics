package process;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import org.apache.log4j.Logger;

public class QueryHive {
    private static Logger mLogger = Logger.getLogger(QueryHive.class);

    private static String driverName = "org.apache.hadoop.hive.jdbc.HiveDriver";

    private Connection con;
    QueryHive() {
        try {
            Class.forName(driverName);
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            System.exit(1);
        }
        try {
            con = DriverManager.getConnection(
                    "jdbc:hive://localhost:10001/default", "", "");
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
    //Start Thrift server: hive --service hiveserver -p 10001
   public static void main(String[] args) throws SQLException {
    	QueryHive myJob = new QueryHive();
        myJob.execute("select * from segmentation_table where Area < 22");
        myJob.con.close(); 
   }

    public ArrayList<String> execute(String query) throws SQLException {
        ArrayList<String> rows = new ArrayList<String>();
        ArrayList[] image_array = new ArrayList[35];
        //ArrayList<List<Individual>> group = new ArrayList<List<Individual>>(4);
        
        for(int i = 0; i < 35; i++){
        	image_array[i] = new ArrayList();
        }
        
        mLogger.info("Starting HiveJob");
       
        Statement stmt = con.createStatement();
        String sql = query;
        ResultSet res = stmt.executeQuery(sql);
        int counter = 0;
        while (res.next()) {
            counter ++;
            
          
            //System.out.println(""+res.getString(1).substring(res.getString(1).indexOf('e')+1, res.getString(1).indexOf('_')));
            if(Integer.parseInt(res.getString(1).substring(res.getString(1).indexOf('e')+1, res.getString(1).indexOf('_'))) < 35){
            	image_array[Integer.parseInt(res.getString(1).substring(res.getString(1).indexOf('e')+1, res.getString(1).indexOf('_')))].add(res.getString(75));
        	}
            
            
            StringBuilder result = new StringBuilder();
            for(int i=1; i<74 ; i++){
                result.append(res.getString(i));
                result.append(":");
            }
            
            rows.add(result.toString());
        }
        System.out.println("Returned " + counter + "rows");
        res.close();
        stmt.close();
        mLogger.info("HiveJob executed!");
        
        Query_old.image_array = image_array;
        
        return rows;
    }
   
}

