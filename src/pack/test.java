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
import org.apache.hadoop.hbase.client.Put;
import org.apache.hadoop.hbase.util.Bytes;

/**
 * Servlet implementation class test
 */
@WebServlet("/test")
public class test extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public test() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
            HBaseConfiguration config = new HBaseConfiguration();
            config.clear();
            config.setInt("timeout", 120000);
            config.set("hbase.rootdir","hdfs://nfs001:8020/hbase");
            config.set("hbase.zookeeper.property.dataDir","/data/shared/hadoop/zookeeper");
            config.set("hbase.cluster.distributed","true");
            config.set("hbase.zookeeper.quorum", "nfs001,nfs002,nfs003,nfs004,nfs005,nfs006,nfs007,nfs008,nfs009,nfs010");
            config.set("hbase.zookeeper.property.clientPort", "2181");
            System.out.println("1");
            HBaseAdmin.checkHBaseAvailable(config);
            System.out.println("2");

            System.out.println("HBase is running!");
            HTable table = new HTable(config, "test");
            Put put = new Put(Bytes.toBytes("test-key"));
            System.out.println("Table mytable obtained ");
            put.add(Bytes.toBytes("cf"), Bytes.toBytes("sam"), Bytes.toBytes("dam"));
            table.put(put);
            System.out.println("End");
		
	}catch (Exception e){
		System.out.println("Exception caught: "+e);
	}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
