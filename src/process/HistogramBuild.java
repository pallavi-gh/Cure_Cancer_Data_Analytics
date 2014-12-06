package process;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

import org.eclipse.core.*;
import org.eclipse.core.resources.ResourcesPlugin;
import org.apache.commons.lang.ArrayUtils;
import org.apache.hadoop.hbase.HBaseConfiguration;
import org.apache.hadoop.hbase.client.HTable;
import org.apache.hadoop.hbase.client.Result;
import org.apache.hadoop.hbase.client.ResultScanner;
import org.apache.hadoop.hbase.client.Scan;
import org.apache.hadoop.hbase.filter.PrefixFilter;
import org.apache.hadoop.hbase.util.Bytes;
import org.apache.hadoop.mapred.IFile;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.statistics.HistogramDataset;
import org.jfree.data.statistics.HistogramType;


public class HistogramBuild {
	
	static ArrayList<Double> per=new ArrayList<Double>();
	static ArrayList<Double> area=new ArrayList<Double>();
	static ArrayList<Double> ecc=new ArrayList<Double>();
	static ArrayList<Double> cytmax=new ArrayList<Double>();
	static ArrayList<Double> cytmin=new ArrayList<Double>();
	
	
	static int count=1;
public  void getHistogram(String img_name) throws IOException {

    org.apache.hadoop.conf.Configuration config = HBaseConfiguration.create();
    config.clear();
    config.setInt("timeout", 120000);
    config.set("hbase.rootdir","hdfs://nfs001:8020/hbase");
    config.set("hbase.zookeeper.property.dataDir","/data/shared/hadoop/zookeeper");
    config.set("hbase.cluster.distributed","true");
    config.set("hbase.zookeeper.quorum", "nfs001,nfs002,nfs003,nfs004,nfs005,nfs006,nfs007,nfs008,nfs009,nfs010");
    config.set("hbase.zookeeper.property.clientPort", "2181");   

    HTable table = new HTable(config, "segmentation_table_new");
    
  byte[] prefix=Bytes.toBytes(img_name);
  Scan scan = new Scan(prefix);
  PrefixFilter prefixFilter = new PrefixFilter(prefix);
  scan.setFilter(prefixFilter);
  ResultScanner resultScanner = table.getScanner(scan);
    
    printRows(resultScanner);
    //System.out.println(count);

    createHistogram(per.toArray(new Double[per.size()]), "Perimeter", img_name);
    createHistogram(area.toArray(new Double[per.size()]), "Area", img_name);
    createHistogram(ecc.toArray(new Double[per.size()]), "Eccentricity", img_name);
    createHistogram(cytmax.toArray(new Double[per.size()]), "CytoplasmMaxIntensity", img_name);
    createHistogram(cytmin.toArray(new Double[per.size()]), "CytoplasmMinIntensity", img_name);
}
public static void printRows(ResultScanner resultScanner) {
    
		for (Iterator<Result> iterator = resultScanner.iterator(); iterator.hasNext();) {
        printRow(iterator.next());
        count++;
    }
}
public static void printRow(Result result) {
    String returnString = null;
    
    returnString = Bytes.toString(result.getValue(Bytes.toBytes("p"), Bytes.toBytes("Perimeter")));
    per.add(Double.parseDouble(returnString));
    returnString = Bytes.toString(result.getValue(Bytes.toBytes("p"), Bytes.toBytes("Area")));
    area.add(Double.parseDouble(returnString));
    returnString = Bytes.toString(result.getValue(Bytes.toBytes("p"), Bytes.toBytes("Eccentricity")));
    ecc.add(Double.parseDouble(returnString));
    returnString = Bytes.toString(result.getValue(Bytes.toBytes("p"), Bytes.toBytes("CytoplasmMaxIntensity")));
    cytmax.add(Double.parseDouble(returnString));
    returnString = Bytes.toString(result.getValue(Bytes.toBytes("p"), Bytes.toBytes("CytoplasmMinIntensity")));
    cytmin.add(Double.parseDouble(returnString));
    //System.out.println(returnString);
}
public static void createHistogram(Double[] ff, String parameter, String img_name) {
   
    int n=ff.length;
    //System.out.println(n);   
    int number = 20; 
    HistogramDataset dataset = new HistogramDataset();
    dataset.setType(HistogramType.RELATIVE_FREQUENCY);
    double[] dff=ArrayUtils.toPrimitive(ff);
    dataset.addSeries("Histogram",dff,number);
    String plotTitle = "Histogram"; 
    String yaxis = "Relative frequency";
    String xaxis = parameter; 
    PlotOrientation orientation = PlotOrientation.VERTICAL; 
    boolean show = false; 
    boolean toolTips = false;
    boolean urls = false; 
    JFreeChart chart = ChartFactory.createHistogram( plotTitle, xaxis, yaxis, 
             dataset, orientation, show, toolTips, urls);
    int width = 600;
    int height = 500; 
     try {
     ChartUtilities.saveChartAsPNG(new File("/home/kumar/workspace/hbase_web_new/WebContent/images/histogram/"+img_name+parameter+".PNG"), chart, width, height);
     } catch (IOException e) { 
    	 System.out.println("Exception caught in save histogram "+e);
     }
  }

/*public static void main(String []args) throws IOException{

	HistogramBuild obj = new HistogramBuild();
	
	for(int i = 0; i < 35; i++){
		obj.getHistogram("image"+i);
	}*/
} 