<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>IfcCompressor</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<link href="style.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="js/cufon-yui.js"></script>
	<script type="text/javascript" src="js/georgia.js"></script>
	<script type="text/javascript" src="js/cuf_run.js"></script>
	<script src="js/jquery.js" type="text/javascript"></script>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="logo"><h1><a href="index.html"><small>BIM everything</small> <span>IFCCompressor</span></a></h1></div>
      <div class="clr"></div>
      <div class="menu">
        <ul>
          <li><a href="index.html">Home</a></li>
          <li><a href="services.jsp" class="active">Services</a></li>
        </ul>
      </div>
    </div>
    <div class="clr"></div>
  </div>
  <div class="body">
    <div class="body_resize">
      <div class="left">
    		<h2>IFCCompressor<br /></h2>
	        <p>IFCCompressor is a free tool built for compressing IFC files. The compression is lossless and the size of the result file is highly reduced. However, the compression result is depandent on the original file, i.e. the more redundant instances the more file size will be reduced.</p>
			<p>Table below is the compression result of our software and Solibri IFC Optimizer in six different models exported by Revit, ArchCAD, ...</p>
			<h2>Benefits of IFCCompressor<br /></h2>
			<li><p>Reduce more size than Solibri IFC Optimizer</p></li>
			<li><p>Smaller loading times and memory occupation in IFC applications</p></li>
			<li><p>Lower data storage costs</p></li>
			<li><p>Can combine with other standard text-based compreesion algorithm</p></li>
	        <br />
	        <div class="blok2">
	        	<img src="images/result.jpg" alt="img" width="75%" height="45%"/>
	        <div class="clr"></div>
	        </div>
		<div class="blok">
			<h2>Online Severice<br /></h2>
			<div class="btn">
			<form action="upLoad.jsp" method="post" enctype="multipart/form-data" id="form1" target="_bland">
				<li><p>You can try to upload your IFC file and acquire the compressed one by clicking <input type="file" name="upfile" size="50" id="IFCfile">.</p></li>
				<li><p> Then click <input type="button" value="submit" onClick="onUpload();"> to upload.</p></li>
			 	<li><p>When compression finished, you can click <input type="button" id="download" value="Download" onclick="onDownload();"> to download your compressed IFC file.</p></li>
			</form>
			</div>
			<script language="JavaScript">
				String.prototype.GetValue= function(parm) {  
			    var reg = new RegExp("(^|&)"+ parm +"=([^&]*)(&|$)");  
			    var r = this.substr(this.indexOf("\?")+1).match(reg);  
			    if (r!=null) 
			    	return unescape(r[2]); 
			    return null;  
				 } 
				var url = location.href;
				
				var filename = url.GetValue("name");
				if (filename != null || filename !=null)
				{
					alert("Compression complete!");
					//window.open("download.jsp?name="+filename, '_parent');
					document.getElementById('download').disabled=false;
				}else
				{	
					document.getElementById('download').disabled=true;
				}
				function onDownload()
				{
					window.open("download.jsp?name="+filename, '_parent');
				}
				function onUpload()
				{
					var filename=document.getElementById('IFCfile').value.toLowerCase();
					if (filename==""||filename==null)
						alert("please choose an IFC file!");
					else
					{
						var fileexec =/\.[^\.]+/.exec(filename);
						if (fileexec == ".ifc")
						{
							document.getElementById('form1').submit();
						}else
							alert("Not an IFC file");
					}
				}
			</script>
		</div>
		<div class="blok">
			<h2>Example<br /></h2>
			<div class="btn">
					<p>Click <input id="Show Example" onclick="Load();" value="Show Example" type="button"/> to see the model view of example IFC file between original one and compressed one</p>
	       	</div>
			<table border="1">
			  	<tr>
			    	<th><object id="TrivialObject" type="trivial/very" width="300" height="300" iurl="1"  section="0" hideSideBar="1"></object></th>
			    	<th><object id="TrivialObject2" type="trivial/very" width="300" height="300" iurl="0" section="0" hideSideBar="1"></object></th>
			  	</tr>
			</table>
			<p>If you can't see the model, please <a href="bin/setup_plugin.exe"> click here </a> to setup the plugin and restart the browser again</p>
		    <script language="JavaScript">
			var OriginalModel = document.getElementById('TrivialObject');
			var CompressedModel = document.getElementById('TrivialObject2');
			function Load()
			{
				OriginalModel.iurl="1";
				OriginalModel.filename="http://localhost:8080/myapp/ifc/classic6.obj";
				CompressedModel.iurl="1";
				CompressedModel.filename="http://localhost:8080/myapp/ifc/classic6.obj";
			}
			</script>
      	</div>
		
		<!--
		<table align="left">
			<td><p>Please Upload your IFC file: </p></td>
		</table>
		<form action="upLoad.jsp" method="post" enctype="multipart/form-data">
			<input type="file" name="upfile" size="50">
			<input type="submit" value="submit">
		</form>
		-->
      </div>
      <div class="clr"></div>
    </div>
  </div>
    <div class="FBG">
    <div class="FBG_resize">
        <h2>Contact Us</h2>
        <p>E-mail: <a href="#">jingsun001@gmail.com</a><br />
          Telephone Number:+0 86 15811392834</p>
      <div class="clr"></div>
    </div>
  </div>
  <div class="footer">
    <div class="footer_resize">
      <p>&copy; Copyright CADBIM11.</p>
    </div>
    <div class="clr"></div>
  </div>
</div>
</body>
</html>

</body>
</html>
