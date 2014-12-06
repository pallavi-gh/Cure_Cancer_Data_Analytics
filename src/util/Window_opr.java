package util;


import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import org.apache.commons.lang.ArrayUtils;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.statistics.HistogramDataset;
import org.jfree.data.statistics.HistogramType;


public class Window_opr {

private static Connection connection;
private static String[] col;
 

public static void main(String [] args) {
	Window_opr hist = new Window_opr();
    hist.generateHistogram("10", "10");
}

public static void generateHistogram(String ImageID , String Win_num) {
try {
// The newInstance() call is a work around for some
// broken Java implementations

    Class.forName("com.mysql.jdbc.Driver").newInstance();
} catch (Exception ex) {
	System.out.println("Class.forName failed");
    // handle the error
}

try {
    connection = DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/test", "", "");

} catch (SQLException e) {
    System.out.println("Connection Failed! Check output console");
    e.printStackTrace();
    return;
}

if (connection != null) {

    Statement stmt = null;
    try {
    stmt = connection.createStatement();
        ResultSet resultScanner = stmt.executeQuery("select * from class_histogram where Image_ID = "  +  ImageID + " and  Win_no = " + Win_num);
 

   
 // ResultScanner resultScanner = table.getScanner(scan);
  
    //printRows(resultScanner);
    //System.out.println(count);
    if (resultScanner.next()) {
        int Image_ID = resultScanner.getInt(1);
        int Win_no = resultScanner.getInt(2);
        ArrayList<Double> row = new ArrayList<Double>();
        for (int col = 3; col <= 32 ; col++) {
            row.add(resultScanner.getDouble(col));
        }
        createHistogram( row.toArray(new Double[row.size()]), Image_ID + "-" + Win_no);
    }
}
    catch (SQLException e) {
        // TODO Auto-generated catch block
        e.printStackTrace();
    }
}

}

public static void createHistogram(Double[] ff, String parameter) {
 
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
     ChartUtilities.saveChartAsPNG(new File("/home/kumar/workspace/hbase_web_new/WebContent/images/window/"+parameter+".PNG"), chart, width, height);
     } catch (IOException e) {}
    }
   }