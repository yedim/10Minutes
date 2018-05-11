package com.tenminute.jsp;

public class ReadWriteFile {
	public static String readFile(String data)
	{
		return data.toUpperCase();
	}
	//page import com.tenminute.jsp.ReadWriteFile
	//jsp 파일에서는 <%=ReadWriteFile.readFile("FunFunFun")
}
