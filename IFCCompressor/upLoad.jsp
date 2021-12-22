<%@page language="java" contentType="text/html;charset=UTF-8"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="javax.servlet.*"%>
<%@page import="javax.servlet.http.*"%>
<%
int MAX_SIZE=102400*102400;
String rootPath;
DataInputStream in=null;
FileOutputStream fileOut=null;
String remoteAddr=request.getRemoteAddr();
String serverName=request.getServerName();
String realPath=request.getRealPath(serverName);
realPath=realPath.substring(0,realPath.lastIndexOf("\\"));
rootPath=realPath+"\\upload";

String contentType=request.getContentType();
try{
	if(contentType.indexOf("multipart/form-data")>=0){
		//out.println("<p>file is under processing, please wait!</p>");
		in=new DataInputStream(request.getInputStream());
		int formDataLength=request.getContentLength();
		if(formDataLength>MAX_SIZE){
			out.println("<P>File size extent the max size!</P>");
			return;
		}
		byte dataBytes[]=new byte[formDataLength];
		int byteRead=0;
		int totalBytesRead=0;
		while(totalBytesRead<formDataLength){
			byteRead=in.read(dataBytes,totalBytesRead,formDataLength);
			totalBytesRead+=byteRead;
		}
		String file=new String(dataBytes);
		String saveFile=file.substring(file.indexOf("filename=\"")+10);
		saveFile=saveFile.substring(0,saveFile.indexOf("\n"));
		saveFile=saveFile.substring(saveFile.lastIndexOf("\\")+1,saveFile.indexOf("\""));
		int lastIndex= contentType.lastIndexOf("=");
		String boundary=contentType.substring(lastIndex+1,contentType.length());
		String fileName=rootPath+"\\"+saveFile;
		int pos;
		pos=file.indexOf("filename=\"");
		pos=file.indexOf("\n",pos)+1;
		pos=file.indexOf("\n",pos)+1;
		pos=file.indexOf("\n",pos)+1;
		int boundaryLocation = file.indexOf(boundary,pos)-4;
		int startPos=((file.substring(0,pos)).getBytes()).length;
		int endPos=((file.substring(0,boundaryLocation)).getBytes()).length;
		File checkFile=new File(fileName);
		if(!checkFile.exists())
		{
			File fileDir=new File(rootPath);
			if(!fileDir.exists()){
				fileDir.mkdirs();
			}
			fileOut=new FileOutputStream(fileName);
			fileOut.write(dataBytes,startPos,(endPos-startPos));
			fileOut.close();
		}
		//out.println("<p>file is sucessful uploaded!</p>");
		String binPath = rootPath;
		String cmd=binPath+"\\IfcCompression.exe "+binPath+'\\'+saveFile;
		Process me=Runtime.getRuntime().exec(cmd);
		me.waitFor();
		String compressedFile="services.jsp?name="+saveFile+".ifc";
		//out.println(compressedFile);
		//
		// 设置响应头和下载保存的文件名
		response.sendRedirect(compressedFile);
	}else{
		String content=request.getContentType();
		out.println("<p>data type is not multipart/form-data</p>");
	}
}catch(Exception ex){
	throw new ServletException(ex.getMessage());
}
%> 

	
		
		