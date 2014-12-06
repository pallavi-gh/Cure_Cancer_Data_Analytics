Cure_Cance_Data_Analytics
=========================


Installation steps:
The project is to be setup on cluster using Eclipse. with Hadoop, Hbase and Hive modules loaded. 

1. Create a new Dynamic Web Project in Eclipse
2. Import jars for Hadoop, Hive, Hbase and mysql into WebContent->WEB-INF->lib
3. Download and configure Apache Tomcat 8 in the Servers section in Eclipse
4. Clean and Build the project
5. Run "hive --service hiveserver -p 10001" to start Hive Server
6. Deploy the project on Apache Tomcat Server 8
7. Now you can access the website on localhost
