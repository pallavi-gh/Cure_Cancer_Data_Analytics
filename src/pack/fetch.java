package pack;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.hadoop.hbase.HBaseConfiguration;
import org.apache.hadoop.hbase.client.HBaseAdmin;
import org.apache.hadoop.hbase.client.HTable;
import org.apache.hadoop.hbase.client.ResultScanner;
import org.apache.hadoop.hbase.client.Scan;

import com.google.protobuf.ServiceException;

/**
 * Servlet implementation class fetch
 */
@WebServlet("/fetch")
public class fetch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public fetch() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HBaseConfiguration config = new HBaseConfiguration();
        config.clear();
        config.setInt("timeout", 120000);
        config.set("hbase.rootdir","hdfs://nfs001:8020/hbase");
        config.set("hbase.zookeeper.property.dataDir","/data/shared/hadoop/zookeeper");
        config.set("hbase.cluster.distributed","true");
        //config.set("hbase.master", "eagle.bmi.stonybrook.edu:60000");
        //config.set("hbase.regionserver.port", "60020");
        //config.set("dfs.replication", "1");
        //config.set("hbase.tmp.dir", "/tmp/hbase-kumar/hbase");
        config.set("hbase.zookeeper.quorum", "nfs001,nfs002,nfs003,nfs004,nfs005,nfs006,nfs007,nfs008,nfs009,nfs010");
        config.set("hbase.zookeeper.property.clientPort", "2181");
        //HBaseConfiguration config = HBaseConfiguration.create();
//config.set("hbase.zookeeper.quorum", "localhost");  // Here we are running zookeeper locally
        System.out.println("1");
        try {
			HBaseAdmin.checkHBaseAvailable(config);
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        System.out.println("2");

		
		Scan s = new Scan();
		s.addColumn("cf".getBytes(),"sam".getBytes());
		HTable table = new HTable(config, "test");
		ResultScanner scanner = table.getScanner(s);
		try {
		  // Scanners return Result instances.
		  // Now, for the actual iteration. One way is to use a while loop like so:
		  for (org.apache.hadoop.hbase.client.Result rr = scanner.next(); rr != null; rr = scanner.next()) {
		    // print out the row we found and the columns we were looking for
		    System.out.println("Found row: " + rr);
		    //System.out.println(rr);
		  }

		  // The other approach is to use a foreach loop. Scanners are iterable!
		  // for (Result rr : scanner) {
		  //   System.out.println("Found row: " + rr);
		  // }
		} finally {
		  // Make sure you close your scanners when you are done!
		  // Thats why we have it inside a try/finally clause
		  scanner.close();
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
